import 'package:flutter/material.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: Icon(Icons.menu, color: Theme.of(context).colorScheme.surface,),
          centerTitle: true,
          title: Text("Conversations",
          style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 18, fontWeight: FontWeight.w600),),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.all(7),
                height: 45,
                child: SearchBar(
                  hintText: "Search...",
                  elevation: const WidgetStatePropertyAll(1),
                  leading: const Icon(Icons.search),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    MessagesTab(),
                    Center(child: Text('Tab 2 Content')),
                    Center(child: Text('Tab 3 Content')),
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