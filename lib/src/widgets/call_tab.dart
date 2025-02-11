import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/home/models/call.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/providers/calls.providers.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class CallTab extends StatefulWidget {
  const CallTab({super.key});
  @override
  State<CallTab> createState() => _CallTab();
}

class _CallTab extends State<CallTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
              children: [
                const CustomAppBar(searchHint: "Search people, calls",),
                Expanded(
                  child: ListView.separated(
                    itemCount: calls.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox.shrink(),
                    itemBuilder: (context, index) {
                      final call = calls[index];
                      return ListTile(
                        leading: CircleAvatar(
          radius: 25,
          child: ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/user.jpg',
              image: call.profileImage,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/user.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        title: CustomText(text: call.name, weight: FontWeight.w500 ,color: call.status == CallStatus.missed ? Colors.red : black, letterspacing: 0.1,),
        subtitle: CustomText(size: 13, text: call.timestamp, color: call.status == CallStatus.missed ? Colors.red : const Color.fromARGB(255, 63, 63, 63), letterspacing: 0.1,),
        trailing: SvgPicture.asset(
          getAllIcon(call),
          height: 27,
          width: 27,
          colorFilter: getCallIconColor(call),
        )
        );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svgs/safety_check.svg", height: 20, width: 20),
                      const CustomText(text: "Your calls are safe; we prioritize security", letterspacing: 0.1, size: 14,),
                    ],
                  ),
                )
              ],
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset("assets/svgs/call_add.svg", height: 25, width: 25),
        ),
              );
  }

  String getAllIcon(Call call) {
    if (call.isVideoCall) {
      switch (call.status) {
        case CallStatus.missed: return "assets/svgs/incoming_video.svg";
        case CallStatus.outgoing: return "assets/svgs/outgoing_video.svg";
        case CallStatus.incoming: return "assets/svgs/incoming_video.svg";
      }
    }
    else {
      switch (call.status) {
        case CallStatus.missed: return "assets/svgs/incoming.svg";
        case CallStatus.outgoing: return "assets/svgs/outgoing.svg";
        case CallStatus.incoming: return "assets/svgs/incoming.svg";
      }
    }
  }

  ColorFilter getCallIconColor(Call call) {
  if (call.status == CallStatus.missed) {
    return const ColorFilter.mode(Colors.red, BlendMode.srcIn);
  } else {
    return const ColorFilter.mode(black, BlendMode.srcIn);
  }
}
}