import 'package:ecommerce_app/auth/login/bloc/login_bloc_bloc.dart';
import 'package:ecommerce_app/auth/login/login.dart';
import 'package:ecommerce_app/auth/login/login_widgets.dart';
import 'package:ecommerce_app/pages/dashboard/cubit/navigation_cubit.dart';
import 'package:ecommerce_app/pages/dashboard/dashboard.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidateOTP extends StatefulWidget {
  final String phoneNo;
  const ValidateOTP({Key? key, required this.phoneNo}) : super(key: key);

  @override
  State<ValidateOTP> createState() => _ValidateOTPState();
}

class _ValidateOTPState extends State<ValidateOTP> {
  var otpVal = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: backArrow(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: const PageScrollPhysics(),
                child: Column(
                  children: [
                    Image(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.contain,
                        image:
                            const AssetImage("assets/images/verify_otp.jpg")),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "OTP Verifiaction",
                      style: GoogleFonts.righteous(
                          fontSize: 35, color: Colors.red),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Enter the OTP sent to  ',
                            style: TextStyle(
                                fontSize: 16,
                                color: grey,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: "+91-${widget.phoneNo}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: black))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    OtpTextField(
                        margin: const EdgeInsets.all(8),
                        cursorColor: Colors.black,
                        mainAxisAlignment: MainAxisAlignment.center,
                        numberOfFields: 6,
                        fillColor: Colors.transparent,
                        filled: true,
                        textStyle: const TextStyle(
                          fontSize: 22,
                        ),
                        showFieldAsBox: false,
                        focusedBorderColor: black,
                        onCodeChanged: (value) {},
                        onSubmit: (code) {
                          otpVal = code;
                          BlocProvider.of<LoginBlocBloc>(context)
                              .add(OtpValidEvent(code));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Dont receive the OTP?   ",
                            style: TextStyle(
                                fontSize: 16,
                                color: grey,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: "RESEND OTP",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: amber))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: BlocConsumer<LoginBlocBloc, LoginBlocState>(
                  listener: (context, state) {
                    if (state is OTPErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMsg),
                        backgroundColor: red,
                      ));
                    } else if (state is PhoneAuthVerified) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => NavigationCubit(),
                                    child: const Dashboard(),
                                  )),
                          (Route<dynamic> route) => false);
                    }
                  },
                  builder: (context, state) {
                    return (state is LoadingState)
                        ? SizedBox(
                            height: 50,
                            width: double.maxFinite,
                            child: loadingButtonView(),
                          )
                        : AuthButton(
                            bgColor: (state is OtpValidState)
                                ? Colors.amber
                                : Colors.grey.shade300,
                            textColor: (state is OtpValidState) ? black : white,
                            btnText: "PROCEED",
                            onPress: () {
                              if (state is OtpValidState) {
                                BlocProvider.of<LoginBlocBloc>(context).add(
                                    VerifySendOTPEvent(
                                        otpCode: otpVal,
                                        verificationId: LoginScreen.verify));
                              }
                            });
                  },
                ),
              )
            ],
          ),
        ));
  }
}
