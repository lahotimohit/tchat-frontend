import 'package:flutter/material.dart';
import 'package:tchat_frontend/chats/screen/main.dart';
import 'package:tchat_frontend/home/data/messages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/home/widget/all_contacts.dart';
import 'package:tchat_frontend/home/widget/drawer.dart';
import 'package:tchat_frontend/home/widget/show_profile_image.dart';

class MessagesTab extends StatefulWidget {
  const MessagesTab({super.key});
  @override
  State<MessagesTab> createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Conversations",
          style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
        leading: IconButton(
            onPressed: () {
              showCustomBottomDrawer(context);
            },
            icon: const Icon(Icons.menu)),
      ),
      body: messages.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Message',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'You not have any Message yet.',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color.fromARGB(255, 154, 156, 164)),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(7),
                  height: 45,
                  child: SearchBar(
                    hintText: "Search...",
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(182, 229, 227, 227)),
                    elevation: const WidgetStatePropertyAll(0),
                    leading: const Icon(Icons.search),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: messages.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox.shrink(),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 3),
                        leading: InkWell(
                            onTap: () {
                              showProfileImage(context, message.profileImage,
                                  message.username);
                            },
                            child: CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/user.jpg',
                                  image: message.profileImage,
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/user.jpg',
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            )),
                        title: Text(
                          message.username,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(message.lastMessage,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(184, 34, 34, 34))),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ChatMainScreen(
                                    username: message.username,
                                    profileImage: message.profileImage,
                                    status: "Online",
                                  )));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => ContactsScreen()));
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
