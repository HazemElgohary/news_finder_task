import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primary = const Color(0xFF9D146B);
  static Color second = const Color(0xFF9B9B9B);
  static Color thrid = const Color(0XFFf4dbc5);
  static Color buttonColor = const Color(0xFFE68B6B);
  static Color loadingColor = const Color(0xFFAC2F2F);
  static Color cardColor = const Color(0xFFF7F7F9);
  static Color borderColor = const Color(0xFFE9E9E9);
  static Color redColor = const Color(0xFFFF6363);
  static Color greenColor = const Color(0xFF80BD71);
  static Color scaffoldColor = const Color(0XFF795A99);

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
}

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: GoogleFonts.amiri().fontFamily,
    textTheme: GoogleFonts.amiriTextTheme(
      Theme.of(context).textTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.primary,
    ),
    // scaffoldBackgroundColor: const Color(0XFF795A99),
    primaryColor: AppColors.primary,
    unselectedWidgetColor: AppColors.primary,
    // toggleableActiveColor: AppColors.primary,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.amiri(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      // color: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: context.textTheme.titleLarge!.copyWith(
        color: AppColors.blackColor,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.whiteColor, size: 30),
    ),
    dividerColor: Colors.transparent,
    radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => Colors.black)),
    indicatorColor: AppColors.primary,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
  );
}
