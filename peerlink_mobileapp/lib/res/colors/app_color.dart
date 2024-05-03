import 'package:flutter/material.dart';

class AppColor {
  static const String themeColor1CodeHexa = "#fff1a443";
  static const String themeColor2CodeHexa = "#ff2e4757";
  static const String appbarColorCodeHexa = "#fff7d2a0";

  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;

  static const appbarColor = Color(0xfff7d2a0);
  static const primaryColor = Color(0xfff1a443);
  static const secondaryColor = Color(0xff2e4757);

  Color themeColor1 =
      Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
  Color themeColor2 =
      Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
  // Color appbarColor =
  // Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));
  static BoxShadow cardShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.6),
      spreadRadius: 0.5,
      blurRadius: 2,
      offset: const Offset(0, 5));
}
