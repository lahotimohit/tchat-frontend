import 'package:tchat_frontend/services/storage.dart';
import 'package:tchat_frontend/setting/screen/main.dart';
import 'package:tchat_frontend/splash_screen/screen/main.dart';
import 'package:flutter/material.dart';

void showCustomBottomDrawer(BuildContext context) {
  SecureStorage storage = SecureStorage();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DrawerHeader(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.8),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "saccamark@gmail.com",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          const SizedBox(height: 16),
                          _buildListTile(
                              icon: Icons.group,
                              title: "New Group",
                              onTap: () {}),
                          _buildListTile(
                              icon: Icons.broadcast_on_home,
                              title: "New Broadcast",
                              onTap: () {}),
                          _buildListTile(
                              icon: Icons.link,
                              title: "Linked Device",
                              onTap: () {}),
                          _buildListTile(
                              icon: Icons.star_rounded,
                              title: "Starred Messages",
                              onTap: () {}),
                          _buildListTile(
                              icon: Icons.settings,
                              title: "Settings",
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => SettingMainScreen()));
                              }),
                          _buildListTile(
                              icon: Icons.logout,
                              title: "Logout",
                              onTap: () {
                                storage.deleteData("access_token");
                                storage.deleteData("refresh_token");
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (ctx) => SplashScreen()),
                                  (Route<dynamic> route) => false,
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildListTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.grey, size: 26),
    title: Text(
      title,
      style: const TextStyle(color: Colors.black87),
    ),
    onTap: onTap,
  );
}
