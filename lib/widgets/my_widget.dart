import 'dart:io';

import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget backArrow() {
  return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () => exit(0),
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 20,
        color: black,
      ));
}

Widget loadingButtonView() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.amber, borderRadius: BorderRadius.circular(5)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Please wait",
            style: GoogleFonts.robotoSlab(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: black,
            )),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: black,
            ))
      ],
    ),
  );
}
