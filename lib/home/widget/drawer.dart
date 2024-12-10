import 'package:flutter/material.dart';
import 'package:tchat_frontend/services/storage.dart';
import 'package:tchat_frontend/setting/screen/main.dart';
import 'package:tchat_frontend/splash_screen/screen/main.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});

  final SecureStorage _storage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2019/08/28/17/17/girl-4437225_640.jpg",
                    ),
                    radius: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mark Sacca",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "saccamark@gmail.com",
                        style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.surface),
                      )
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.grey, size: 26),
            title: const Text(
              "New Group",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.broadcast_on_home,
                color: Colors.grey, size: 26),
            title: const Text(
              "New Broadcast",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.link, color: Colors.grey, size: 26),
            title: const Text(
              "Linked Device",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
          ListTile(
            leading:
                const Icon(Icons.star_rounded, color: Colors.grey, size: 26),
            title: const Text(
              "Starred Messages",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey, size: 26),
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => SettingMainScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.grey, size: 26),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
              _storage.deleteData("access_token");
              _storage.deleteData("refresh_token");
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => SplashScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
