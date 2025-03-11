import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/screens/settings.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
PopupMenuItem<String> buildPopupMenuItem(String text) {
  return PopupMenuItem(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    value: text,
    child: CustomText(text: text, size: 14, weight: FontWeight.w500,)
  );
}

  void handleMenuClick(BuildContext context, String value) {
    switch (value) {
      case "Profile":
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ProfileScreen()));
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