import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/common.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  const CustomText(
      {super.key,
      @required this.text,
      this.size,
      this.color,
      this.weight,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: align ?? TextAlign.left,
        style: GoogleFonts.poppins(
            fontSize: size ?? 16,
            color: color ?? black,
            fontWeight: weight ?? FontWeight.normal));
  }
}
