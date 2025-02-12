import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/src/screens/profile.dart';
import 'package:tchat_frontend/src/screens/settings.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.searchHint, required this.tab});
  final String searchHint;
  final String tab;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: "TChat", size: 20, weight: FontWeight.w600,),
                      PopupMenuButton<String>(
        onSelected: (value) {
          _handleMenuClick(context, value);
        },
        offset: const Offset(-10, 35),
        color: white,
        itemBuilder: (BuildContext context) {
          if (tab == "messages") {
            return [
              _buildPopupMenuItem("Profile"),
              _buildPopupMenuItem("New group"),
              _buildPopupMenuItem("Link Device"),
              _buildPopupMenuItem("Settings"),
            ];
          } else if (tab == "community") {
            return [
              _buildPopupMenuItem("Settings"),
            ];
          } else if (tab == "calls") {
            return [
              _buildPopupMenuItem("Clear call logs"),
            ];
          } else {
            return []; // Empty menu if no condition matches
          }
        },
      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 45,
                  child: SearchBar(
                    hintText: searchHint,
                    hintStyle: WidgetStateProperty.all<TextStyle>(
                      GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                        color: const Color.fromARGB(255, 174, 174, 174),
                      ),
                    ),
                     shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 230, 230, 230),
                          width: 1,
                        ),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 247, 248, 249)),
                    elevation: const WidgetStatePropertyAll(0),
                    leading: SvgPicture.asset("assets/svgs/magnifier.svg"),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                    ),
                  ),
                ),
      ],
    );

  }
  PopupMenuItem<String> _buildPopupMenuItem(String text) {
  return PopupMenuItem(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    value: text,
    child: CustomText(text: text, size: 14, weight: FontWeight.w500,)
  );
}

  void _handleMenuClick(BuildContext context, String value) {
    switch (value) {
      case "Profile":
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ProfileScreen()));
        break;
      case "New group":
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingMainScreen()));
        break;
      case "New broadcast":
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingMainScreen()));
        break;
      case "Link Device":
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingMainScreen()));
        break;
      case "Settings":
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingMainScreen()));
        break;
    }
  }
}