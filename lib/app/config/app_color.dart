import 'package:flutter/material.dart';

class AppColor {
  static const bg = Color(0xffFAF1E6);
  static const appBar = Color(0xff064420);
  static const fieldbg = Color(0xffD2F8D6);
  static var btn = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xff064420).withOpacity(0.75),
        const Color(0xff064420),
      ]);
  static const text1 = Color(0xff343434);
  static const text2 = Color(0xffF8FDF6);
  static const text3 = Color(0xff0D3368);
}
