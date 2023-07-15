import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactTextField extends StatelessWidget {
  final TextEditingController phoneController;
  final void Function(String)? onChange;
  const ContactTextField(
      {Key? key, required this.phoneController, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.amber),
          ),
          prefixText: "+91 ",
          prefixStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          hintText: "Enter Phone Number",
          hintStyle: TextStyle(
            color: Colors.black45,
          ),
          counterText: "",
          isDense: true,
          contentPadding: EdgeInsets.all(15)),
      style: TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w300),
      cursorColor: black,
      cursorHeight: 20,
      cursorWidth: 1,
      onChanged: onChange,
    );
  }
}

class AuthButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String btnText;
  final void Function()? onPress;
  const AuthButton(
      {Key? key,
      required this.bgColor,
      required this.textColor,
      required this.btnText,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(bgColor),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
        onPressed: onPress,
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoSlab(
              fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
        ));
  }
}
