import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/common.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final TextOverflow? overflow;
  final FontWeight? weight;
  final TextAlign? align;
  final int? maxlines;
  final bool? isSoftWrap;
  final double? letterspacing;
  final Alignment? alignment;

  const CustomText(
      {super.key,
      this.text,
      this.size,
      this.maxlines,
      this.color,
      this.isSoftWrap,
      this.overflow,
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
          overflow: overflow,
          softWrap: isSoftWrap,
          maxLines: maxlines,
          style: TextStyle(fontFamily: "Poppins", fontSize: size ?? 16, letterSpacing: letterspacing ?? 0.1, color: color ?? black, fontWeight: weight ?? FontWeight.normal)
              ),
    );
  }
}


TextStyle customTextStyle(double? size, Color? color, FontWeight? weight) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: size ?? 16,
    color:  color ?? black,
    fontWeight: weight ?? FontWeight.normal
  );
}
