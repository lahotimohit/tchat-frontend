import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

Widget emptyTab(String message, String svgPath) {
  return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath, height: 200, width: 200),
          const SizedBox(height: 20),
          CustomText(text: message, alignment: Alignment.center,),
        ],
      ),);
}