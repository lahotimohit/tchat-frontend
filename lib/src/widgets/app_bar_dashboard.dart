import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/widgets/popup_menuitem.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.tab, this.message});
  final String? message;
  final String tab;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String searchHint = ""; // ✅ Initialize searchHint

  @override
  void initState() {
    super.initState();
    updateSearchHint(); // ✅ Update searchHint based on tab
  }

  void updateSearchHint() {
    if (widget.tab == "messages") {
      searchHint = "Search messages, people";
    } else if (widget.tab == "community") {
      searchHint = "Search community, groups";
    } else if (widget.tab == "calls") {
      searchHint = "Search people, calls";
    } else {
      searchHint = widget.message ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "TChat",
                size: 20,
                weight: FontWeight.w600,
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  handleMenuClick(context, value);
                },
                offset: const Offset(-10, 35),
                color: white,
                itemBuilder: (BuildContext context) {
                  return [
                    if (widget.tab == "messages") ...[
                      buildPopupMenuItem("Profile"),
                      buildPopupMenuItem("New group"),
                      buildPopupMenuItem("Link Device"),
                      buildPopupMenuItem("Settings"),
                    ],
                    if (widget.tab == "community")
                      buildPopupMenuItem("Settings"),
                    if (widget.tab == "calls") ...[
                      buildPopupMenuItem("Clear call logs"),
                      buildPopupMenuItem("Settings"),
                    ],
                  ];
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
            hintText: searchHint, // ✅ Now correctly set
            hintStyle: WidgetStateProperty.all<TextStyle>(
              customTextStyle(
                14,
                const Color.fromARGB(255, 174, 174, 174),
                FontWeight.w500,
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
}
