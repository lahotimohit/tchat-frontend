import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/home/screen/call_tab.dart';
import 'package:tchat_frontend/home/screen/communities_tab.dart';
import 'package:tchat_frontend/home/screen/messages_tab.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});
  @override
  State<HomeMainScreen> createState() {
    return _HomeMainScreen();
  }
}

class _HomeMainScreen extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    const MessagesTab(),
                    const CommunitiesTab(),
                    CallScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.surface,
          child: TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: [
              _buildTab("assets/svgs/chats.svg", "Chats", 0),
              _buildTab("assets/svgs/groups.svg", "Communities", 1),
              _buildTab("assets/svgs/call.svg", "Calls", 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String assetPath, String text, int index) {
    return Tab(
      icon: Builder(
        builder: (context) {
          final isSelected = DefaultTabController.of(context)?.index == index;
          final color =
              isSelected ? Theme.of(context).colorScheme.primary : Colors.grey;
          return SvgPicture.asset(
            assetPath,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          );
        },
      ),
      text: text,
    );
  }
}
