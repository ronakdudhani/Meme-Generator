import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/text_info.dart';

class ImageText extends StatelessWidget {
  final TextInfo textInfo;
  const ImageText({super.key, required this.textInfo});

  @override
  Widget build(BuildContext context) {
    return Text(
      textInfo.text,
      textAlign: textInfo.textAlign,
      style: GoogleFonts.getFont
      (textInfo.font,
        fontSize: textInfo.fontSize,
        fontStyle: textInfo.fontStyle,
        color: textInfo.color,
        fontWeight: textInfo.fontWeight,

      )

    );
  }
}
