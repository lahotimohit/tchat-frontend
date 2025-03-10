import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

Widget emptyTab(String message, String svgPath, BuildContext context, String tab) {
  return Column(
    children: [
      CustomAppBar(tab: tab),
      SizedBox(height: MediaQuery.of(context).size.height*0.15,),
      Center(
        child: Column(
            children: [
              SvgPicture.asset(svgPath, height: 200, width: 200),
              const SizedBox(height: 20),
              CustomText(text: message, alignment: Alignment.center,),
            ],
          ),),
    ],
  );
}