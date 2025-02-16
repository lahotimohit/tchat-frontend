import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/call_tab.dart';
import 'package:tchat_frontend/src/widgets/community_tab.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/widgets/message_tab.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});
  @override
  State<HomeMainScreen> createState() {
    return _HomeMainScreen();
  }
}

class _HomeMainScreen extends State<HomeMainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  MessageTab(),
                  CommunityTab(),
                  CallTab()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        child: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).colorScheme.primary,
          labelStyle: customTextStyle(12, null ,FontWeight.w600),
          unselectedLabelColor: black,
          indicator: const BoxDecoration(),
          tabs: [
            _buildTab("chats.svg", "chats_color.svg", "Chats", 0),
            _buildTab("groups.svg", "groups_color.svg", "Communities", 1),
            _buildTab("calls.svg", "calls_color.svg", "Calls", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String assetPath, String fillPath, String text, int index) {
    final isSelected = _tabController.index == index;
    final color = isSelected ? Theme.of(context).colorScheme.primary : black;
    final path = isSelected ? "assets/svgs/$fillPath" : "assets/svgs/$assetPath";

    return Tab(
      icon: SvgPicture.asset(
        path,
        height: 26,
        width: 26,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      text: text,      
    );
  }
}
