import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInfo {
  String text;
  double left;
  double top;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;
  String font;

  TextInfo({
    required this.text,
    required this.left,
    required this.top,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
    required this.fontStyle,
    required this.textAlign,
    required this.font,
  });
}
