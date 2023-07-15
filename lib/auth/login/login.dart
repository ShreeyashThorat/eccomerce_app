import 'package:ecommerce_app/Internetbloc/internet_connnectivity_bloc_bloc.dart';
import 'package:ecommerce_app/auth/login/bloc/login_bloc_bloc.dart';
import 'package:ecommerce_app/auth/login/login_widgets.dart';
import 'package:ecommerce_app/auth/login/validate_otp/validate_otp.dart';
import 'package:ecommerce_app/internet_lost.dart';
import 'package:ecommerce_app/pages/dashboard/cubit/navigation_cubit.dart';
import 'package:ecommerce_app/pages/dashboard/dashboard.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String verify = "";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNo = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: BlocBuilder<InternetConnnectivityBlocBloc,
          InternetConnnectivityBlocState>(
        builder: (context, state) {
          if (state is InternetConnectivityLostState) {
            return const InternetLost();
          } else if (state is InternetConnnectivityGetState) {
            return Stack(
              children: [
                ListView(
                  physics: const PageScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.all(25),
                        height: size.height / 2,
                        child: const Image(
                            image: AssetImage("assets/images/auth.jpg"))),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            width: size.width,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Let's Get Started...!",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.righteous(
                                  fontSize: 25, color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ContactTextField(
                            phoneController: phoneNo,
                            onChange: (val) {
                              BlocProvider.of<LoginBlocBloc>(context)
                                  .add(ContactTextChangeEvent(phoneNo.text));
                            },
                          ),
                          BlocBuilder<LoginBlocBloc, LoginBlocState>(
                            builder: (context, state) {
                              if (state is ContactInvalidState) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 10),
                                  child: Text(
                                    state.errorMsg,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          BlocConsumer<LoginBlocBloc, LoginBlocState>(
                            listener: (context, state) {
                              if (state is OTPErrorState) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(state.errorMsg),
                                  backgroundColor: red,
                                ));
                              } else if (state is PhoneAuthCodeSentSuccess) {
                                LoginScreen.verify = state.verificationId;
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  LoginBlocBloc(),
                                              child: ValidateOTP(
                                                  phoneNo: phoneNo.text),
                                            )),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            builder: (context, state) {
                              return SizedBox(
                                height: 50,
                                width: double.maxFinite,
                                child: (state is LoadingState)
                                    ? loadingButtonView()
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              (state is ContactValidState)
                                                  ? Colors.amber
                                                  : Colors.grey.shade300,
                                            ),
                                            elevation:
                                                MaterialStateProperty.all(0),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)))),
                                        onPressed: () {
                                          String contact = "+91${phoneNo.text}";
                                          if (state is ContactValidState) {
                                            BlocProvider.of<LoginBlocBloc>(
                                                    context)
                                                .add(ContactSubmitEvent(
                                                    contact: contact));
                                          }
                                        },
                                        child: Text(
                                          "Continue",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.robotoSlab(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: (state is ContactValidState)
                                                ? black
                                                : white,
                                          ),
                                        )),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                color: Colors.black26,
                              )),
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Text("OR"),
                              ),
                              Expanded(
                                  child: Divider(
                                color: Colors.black26,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "Google",
                                elevation: 3.0,
                                backgroundColor: white,
                                onPressed: () {},
                                child: const Image(
                                    width: 30,
                                    height: 30,
                                    image:
                                        AssetImage("assets/icons/google.png")),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                heroTag: "Facebook",
                                elevation: 3.0,
                                backgroundColor: white,
                                onPressed: () {},
                                child: const Image(
                                    width: 30,
                                    height: 30,
                                    image: AssetImage(
                                        "assets/icons/facebook.png")),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                heroTag: "iPhone",
                                elevation: 3.0,
                                backgroundColor: white,
                                onPressed: () {},
                                child: const Image(
                                    width: 30,
                                    height: 30,
                                    image:
                                        AssetImage("assets/icons/iphone.png")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    right: 10,
                    top: 30,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.black45)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => NavigationCubit(),
                                        child: const Dashboard(),
                                      )));
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(color: white),
                        )))
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
        },
      ),
    );
  }
}
