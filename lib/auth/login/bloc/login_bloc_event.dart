part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent {}

// this event will be triggered when user focused and start typing in contact textfield
class ContactTextChangeEvent extends LoginBlocEvent {
  final String contactValue;
  ContactTextChangeEvent(this.contactValue);
}

// this event will be triggered when user click on continue button
class ContactSubmitEvent extends LoginBlocEvent {
  final String contact;
  ContactSubmitEvent({required this.contact});
}

// this event will triggered when user provide valid contact and press continue button in the UI
class OnOTPSentEvent extends LoginBlocEvent {
  final String verificationId;
  final int? token;
  OnOTPSentEvent({required this.verificationId, required this.token});
}

// this event will be triggered when user occur any error while sending otp to the user's mobile number
class OnPhoneAuthErrorEvent extends LoginBlocEvent {
  final String error;
  OnPhoneAuthErrorEvent({required this.error});
}

//OTP Screens Events

class OtpValidEvent extends LoginBlocEvent {
  final String pin;
  OtpValidEvent(this.pin);
}

//this event will be triggered when user verify otp
class VerifySendOTPEvent extends LoginBlocEvent {
  final String otpCode;
  final String verificationId;
  VerifySendOTPEvent({required this.otpCode, required this.verificationId});
}

class AuthVerificationCompleteEvent extends LoginBlocEvent {
  final AuthCredential credential;
  AuthVerificationCompleteEvent({required this.credential});
}
