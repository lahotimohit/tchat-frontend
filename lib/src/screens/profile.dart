import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Profile", size: 20, weight: FontWeight.w500,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Stack(
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2019/08/28/17/17/girl-4437225_640.jpg",
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ProfileItem(
              icon: SvgPicture.asset("assets/svgs/about.svg"),
              title: "Name",
              subtitle: "Nidhijain",
              trailingIcon: SvgPicture.asset("assets/svgs/edit.svg"),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                SizedBox(width: 35,),
                CustomText(
                  text: "This name will be visible to your contacts.",
                  size: 12,
                  weight: FontWeight.w500,
                  color: grey,
                ),
              ],
            ),
            const SizedBox(height: 30),
            ProfileItem(
              icon: SvgPicture.asset("assets/svgs/info.svg"),
              title: "About",
              subtitle: "I am available on TChat",
              trailingIcon: SvgPicture.asset("assets/svgs/edit.svg"),
            ),
            const SizedBox(height: 20),
            ProfileItem(
              icon: SvgPicture.asset("assets/svgs/call.svg"),
              title: "Phone",
              subtitle: "+91 984XX XXXX",
              trailingIcon: null,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final SvgPicture icon;
  final String title;
  final String subtitle;
  final SvgPicture? trailingIcon;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  size: 12,
                  color: grey,
                  weight: FontWeight.w500,
                ),
                const SizedBox(height: 2),
                CustomText(
                  text: subtitle,
                  size: 15,
                ),
              ],
            ),
          ],
        ),
        if (trailingIcon != null)
        SizedBox(child: trailingIcon),
      ],
    );
  }
}
