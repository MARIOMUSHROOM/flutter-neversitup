import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFEF2A28);
const Color secoundaryColor = Color.fromARGB(255, 10, 25, 231);
const Color tertiaryColor = Color(0xffFFEAD5); //FFEAD5
const Color backgroundWhite = Colors.white;
const Color backgroundColor = Color(0xffFAFAFA);
const Color backgroundfadeColor = Colors.lightGreen;

const Color appTextPrimaryColor = Color(0xff1F1F1F);
const Color appTextSecondaryColor = Color(0xff333333);
const Color appTextSubTitleColor = Color(0xff3B3B3B);
const Color appButtonBorderColor = Color(0xFF828282);
const Color appTextFieldBorderColor = Color(0xffEFEFEF);
const Color appTextButtonColor = Colors.white;

const Color appShadowPrimaryColor = Colors.black;

var gradientStyle = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.3, 0.8],
  colors: [
    primaryColor,
    secoundaryColor,
  ],
);

var gradientColors = [
  primaryColor,
  secoundaryColor,
];

var primaryShodow = [
  BoxShadow(
    color: appShadowPrimaryColor.withOpacity(0.7),
    spreadRadius: 0,
    blurRadius: 6,
    offset: Offset(0, 2),
  ),
];

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };
  return MaterialColor(color.value, shades);
}

final TextStyle appbarTextStyle = GoogleFonts.kanit(
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: appTextPrimaryColor,
);

class AppTheme {
  AppTheme(this.context);
  BuildContext context;

  static ThemeData build(BuildContext context) {
    return ThemeData(
      // useMaterial3: true,
      // fontFamily: FontFamily.SFPro.name,
      primaryColor: primaryColor,
      primarySwatch: getMaterialColor(primaryColor),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: primaryColor,
        background: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: GoogleFonts.kanitTextTheme(
        Theme.of(context).textTheme,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: backgroundWhite,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: appbarTextStyle,
        elevation: 0,
      ),
    );
  }

  InputDecoration textformfieldStyle(
      {String? hintText,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Color? backgroundColor}) {
    return InputDecoration(
      filled: true,
      fillColor: backgroundColor ?? backgroundWhite,
      hintText: hintText,
      hintStyle: TextStyle(
        color: appTextSecondaryColor.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      border: InputBorder.none,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: primaryColor.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: primaryColor.withOpacity(0.8),
        ),
      ),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }

  InputDecoration textformfieldStyle2(
      {String? hintText, Widget? suffixIcon, Widget? prefixIcon}) {
    return InputDecoration(
      filled: true,
      fillColor: tertiaryColor,
      hintText: hintText,
      hintStyle: TextStyle(color: primaryColor.withOpacity(0.2)),
      border: InputBorder.none,
      prefix: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }
}
