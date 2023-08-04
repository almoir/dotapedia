import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = const Color(0xff272727);
Color secondColor = const Color(0xff383838);

Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff000000);
Color greyColor = const Color(0xffA4A8AE);
Color blueColor = const Color(0xff0764DC);
Color greenColor = const Color(0xff09D44C);
Color redColor = const Color(0xffD6071A);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);
TextStyle blueTextStyle = GoogleFonts.poppins(
  color: blueColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: redColor,
);

FontWeight light = FontWeight.w300;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ThemeData getApplicationThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: mainColor,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: secondColor,
      centerTitle: true,
    ),
  );
}
