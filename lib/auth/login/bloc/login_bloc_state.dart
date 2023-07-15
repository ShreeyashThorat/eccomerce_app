part of 'login_bloc_bloc.dart';

abstract class LoginBlocState {}

class LoginBlocInitial extends LoginBlocState {}

class ContactInvalidState extends LoginBlocState {
  final String errorMsg;
  ContactInvalidState(this.errorMsg);
}

class ContactValidState extends LoginBlocState {}

class LoadingState extends LoginBlocState {}

class PhoneAuthCodeSentSuccess extends LoginBlocState {
  final String verificationId;
  PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
}

class OTPErrorState extends LoginBlocState {
  final String errorMsg;
  OTPErrorState({required this.errorMsg});
}

// OTP Screen State

class OtpValidState extends LoginBlocState {}

class OtpInvalidState extends LoginBlocState {}

class OtpLoadingState extends LoginBlocState {}

class PhoneAuthVerified extends LoginBlocState {}
