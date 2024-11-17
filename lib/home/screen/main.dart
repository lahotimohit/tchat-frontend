import 'package:flutter/material.dart';
import 'package:tchat_frontend/home/widget/call_tab.dart';
import 'package:tchat_frontend/home/widget/messages_tab.dart';

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
                    MessagesTab(),
                    Center(child: Text('Tab 2 Content')),
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
            tabs: const [
              Tab(
                icon: Icon(Icons.message),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(Icons.groups),
                text: 'Communities',
              ),
              Tab(
                icon: Icon(Icons.call),
                text: 'Calls',
              ),
            ],
          ),
        ),
      ),
    );
  }
}