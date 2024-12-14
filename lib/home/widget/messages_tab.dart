import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/chats/screen/main.dart';
import 'package:tchat_frontend/home/data/messages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/home/widget/all_contacts.dart';
import 'package:tchat_frontend/home/widget/drawer.dart';
import 'package:tchat_frontend/video_call/screen/main.dart';
import 'package:tchat_frontend/voice_call/screens/main.dart';

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

  void _showProfileImage(
      BuildContext context, String profileImage, String username) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return Stack(
          alignment: Alignment.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                color: Colors.black.withOpacity(0.8),
                width: 2,
                height: 2,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 150,
                    child: ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/user.jpg',
                        image: profileImage,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/user.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ChatMainScreen(
                                  username: username,
                                  profileImage: profileImage,
                                  status: "Online")));
                        },
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 36,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => VoiceCallScreen(
                                  isIncoming: false,
                                  userName: username,
                                  userPhoto: profileImage)));
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 36,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const VideoCallScreen()));
                        },
                        icon: const Icon(
                          Icons.video_call,
                          color: Colors.white,
                          size: 36,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 36,
                        )),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        systemOverlayStyle: SystemUiOverlayStyle(),
        title: Text(
          "Conversations",
          style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
      ),
      drawer: SizedBox(width: 270, child: MainDrawer()),
      body: messages.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/illustration.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No Message',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You don’t have any Message yet.',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 154, 156, 164)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Message People',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 131, 242)),
                  )
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
                    elevation: const WidgetStatePropertyAll(1),
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
                              _showProfileImage(context, message.profileImage,
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
      floatingActionButton: messages.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => ContactsScreen()));
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
