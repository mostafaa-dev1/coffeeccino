import 'package:cofee_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle style22 = GoogleFonts.poppins(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle style15 = GoogleFonts.poppins(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle style15color = GoogleFonts.poppins(
    fontSize: 15,
    color: AppColors.mainColor,
  );
  static TextStyle style18w = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle style18color = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.mainColor,
  );
}
