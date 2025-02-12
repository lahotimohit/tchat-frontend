import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallBottomBar extends StatelessWidget {
  const CallBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 245, 245, 245),
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/horizontal_dots.svg"),
                    const SizedBox(width: 9,),
                    SvgPicture.asset("assets/svgs/speaker.svg"),
                    const SizedBox(width: 9,),
                    SvgPicture.asset("assets/svgs/mic.svg"),
                    const SizedBox(width: 9,),
                    InkWell(
                      child: SvgPicture.asset("assets/svgs/endCall.svg"),
                      onTap: () {
                        Navigator.of(context).pop();
                      },),
                  ],
                ),
              ),
              const SizedBox(height: 5,)
            ],
          );
  }
}