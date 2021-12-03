import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color bluishClr = Color(0xFF4E5AE8);
// const Color yellowClr = Color(0xFFFF8746);
// const Color pinkClr = Color(0xFFff4667);

const Color darkGreyClr = Color(0xFF121212);
// const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr,
      primarySwatch: Colors.red,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: !Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

// TextStyle get titleStyle {
//   return GoogleFonts.lato(
//       textStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: Get.isDarkMode ? Colors.white : Colors.black));
// }

// TextStyle get robototitleStyle {
//   return GoogleFonts.roboto(
//       textStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: Get.isDarkMode ? Colors.white : Colors.black));
// }

TextStyle get subtitleStyle {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
}

// TextStyle get archivosubtitleStyle {
//   return GoogleFonts.archivo(
//       textStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//           color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
// }

const primaryClr = Color.fromRGBO(2, 95, 51, 1);
var archivotitleStyle = GoogleFonts.archivo(
    textStyle:
        const TextStyle(fontSize: 14, color: Color.fromRGBO(2, 95, 51, 1)));
var archivosubtitleStyle = GoogleFonts.archivo(
    textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Colors.grey.shade700));
var robototitleStyle = GoogleFonts.roboto(
    color: primaryClr,
    fontWeight: FontWeight.w700,
    textStyle: const TextStyle(
      fontSize: 18,
    ));
var robotosubtitleStyle = GoogleFonts.archivo(
    textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Colors.grey.shade700));
