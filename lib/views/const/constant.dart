import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
// Data Storage
  static final box = GetStorage();
//Colors
  static var background = GetStorage().read('IS_DARK_MODE')
      ? const Color.fromRGBO(96, 45, 0, 1)
      : Colors.white;

  //Text Styles
  static TextStyle greetings1 = GetStorage().read('IS_DARK_MODE')
      ? GoogleFonts.inter(
          textStyle: const TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 30,
            fontWeight: FontWeight.w200,
          ),
        )
      : GoogleFonts.inter(
          textStyle: const TextStyle(
            color: Colors.black,
            letterSpacing: 1,
            fontSize: 30,
            fontWeight: FontWeight.w200,
          ),
        );

  static TextStyle greetings2 = GetStorage().read('IS_DARK_MODE')
      ? GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 26,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        )
      : GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontSize: 26,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic),
        );

  static TextStyle cardbuttontext = GetStorage().read('IS_DARK_MODE')
      ? GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )
      : GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        );

  static TextStyle dropdowntext = GetStorage().read('IS_DARK_MODE')
      ? GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
        )
      : GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        );

  static var gradientcard1 = GetStorage().read('IS_DARK_MODE')
      ? const [
          Color.fromRGBO(242, 166, 90, 1),
          Color.fromRGBO(119, 46, 25, 0.96)
        ]
      : const [
          Color.fromRGBO(242, 166, 90, 1),
          Color.fromRGBO(119, 46, 25, 0.96)
        ];
}
