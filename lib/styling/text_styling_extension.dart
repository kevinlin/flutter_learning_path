import 'package:flutter/material.dart';

extension TextStylingExtension on TextStyle {
  constructor() => copyWith(color: Colors.black);

  TextStyle get withWeightLight => copyWith(fontWeight: FontWeight.w300);

  TextStyle get withWeightRegular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get withWeightMedium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get withWeightSemiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get withWeightBold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get withColorRed => copyWith(color: Colors.red);

  TextStyle get withColorWhite => copyWith(color: Colors.white);

  TextStyle get withColorGrey => copyWith(color: Color(0xFF696969));

  TextStyle get withColorError => copyWith(color: Color(0xFFba1a1a));
}
