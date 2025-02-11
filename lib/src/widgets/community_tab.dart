import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});
  @override
  State<CommunityTab> createState() => _CommunityTab();
}

class _CommunityTab extends State<CommunityTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
              children: [
                const CustomAppBar(searchHint: "Search community, groups",),
              ])
    );
  }
}