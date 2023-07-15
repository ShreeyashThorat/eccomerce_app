import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  FirebaseAuth auth = FirebaseAuth.instance;
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<ContactTextChangeEvent>((event, emit) {
      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = RegExp(patttern);
      if (event.contactValue.length != 10 &&
          !regExp.hasMatch(event.contactValue)) {
        emit(ContactInvalidState("Please enter a valid mobile number"));
      } else {
        emit(ContactValidState());
      }
    });

    on<ContactSubmitEvent>(onSendOTP);

    on<OnOTPSentEvent>((event, emit) =>
        emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

    on<OnPhoneAuthErrorEvent>(
        (event, emit) => emit(OTPErrorState(errorMsg: event.error)));

    on<OtpValidEvent>((event, emit) {
      if (event.pin.length != 6) {
        emit(OtpInvalidState());
      } else {
        emit(OtpValidState());
      }
    });

    on<VerifySendOTPEvent>(onVerifyOTP);

    on<AuthVerificationCompleteEvent>(loginWithCreditial);
  }

  FutureOr<void> onSendOTP(
      ContactSubmitEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoadingState());
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: event.contact,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            add(OnPhoneAuthErrorEvent(error: e.code));
          },
          codeSent: (String verificationId, int? resendToken) {
            add(OnOTPSentEvent(
                verificationId: verificationId, token: resendToken));
          },
          codeAutoRetrievalTimeout: (String verificatioId) {});
    } catch (e) {
      emit(OTPErrorState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> onVerifyOTP(
      VerifySendOTPEvent event, Emitter<LoginBlocState> emit) async {
    try {
      emit(LoadingState());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId, smsCode: event.otpCode);
      add(AuthVerificationCompleteEvent(credential: credential));
    } catch (e) {
      emit(OTPErrorState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> loginWithCreditial(
      AuthVerificationCompleteEvent event, Emitter<LoginBlocState> emit) async {
    try {
      await auth.signInWithCredential(event.credential).then((user) {
        if (user.user != null) {
          emit(PhoneAuthVerified());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(OTPErrorState(errorMsg: e.code));
    } catch (e) {
      emit(OTPErrorState(errorMsg: e.toString()));
    }
  }
}
