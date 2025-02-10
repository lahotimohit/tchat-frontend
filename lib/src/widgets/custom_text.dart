import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/common.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final double? letterspacing;
  final Alignment? alignment;
  const CustomText(
      {super.key,
      @required this.text,
      this.size,
      this.color,
      this.weight,
      this.alignment,
      this.letterspacing,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topLeft,
      child: Text(text!,
          textAlign: align ?? TextAlign.left,
          style: GoogleFonts.poppins(
              fontSize: size ?? 16,
              letterSpacing: letterspacing,
              color: color ?? black,
              fontWeight: weight ?? FontWeight.normal)),
    );
  }
}
