import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class CallAppBar extends StatelessWidget {
  const CallAppBar({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back_ios_new)),
                  Column(
                    children: [
                      CustomText(text: username, weight: FontWeight.w600,),
                      const CustomText(text: "1:00:01", size: 14, color: grey, weight: FontWeight.w500,)
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/user_add_call.svg"),
                      const SizedBox(width: 15,)
                    ],
                  ),
                ],
              ),
            ],
          );
  }
}