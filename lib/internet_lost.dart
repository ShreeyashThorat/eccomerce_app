import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InternetLost extends StatelessWidget {
  const InternetLost({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/internet_lost.svg",
            height: MediaQuery.of(context).size.height / 2,
            width: double.maxFinite,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Ooops",
            textAlign: TextAlign.center,
            style: GoogleFonts.righteous(
                fontSize: 50, fontWeight: FontWeight.w500, color: Colors.red),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Please Check Your Internet Connectivity...!",
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                fontSize: 20, fontWeight: FontWeight.w400, color: black),
          )
        ],
      ),
    );
  }
}
