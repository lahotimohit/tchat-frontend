import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/chats/screen/main.dart';
import 'package:tchat_frontend/home/data/messages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/home/widget/drawer.dart';

class MessagesTab extends StatefulWidget {
  const MessagesTab({super.key});
  @override
  State<MessagesTab> createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {

@override
  void initState() {
    super.initState();
    _setStatusBarStyle();
  }

  void _setStatusBarStyle() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:  Color.fromARGB(255, 62, 102, 197),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text("Conversations",
          style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 18, fontWeight: FontWeight.w600),),
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
        ),
        drawer: const SizedBox(
          width: 270,
          child: MainDrawer()),
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
                        color: Color.fromARGB(255, 154, 156, 164)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Message People',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color.fromARGB(255, 91, 131, 242)),
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
                    separatorBuilder: (context, index) => const SizedBox.shrink(),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 3),
                        leading: InkWell(
                          child: CircleAvatar(
                            radius: 25,
                            child: ClipOval(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/user.jpg', 
                                image: message.profileImage,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                                imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/default_profile_image.png',
                                  fit: BoxFit.cover,
                                );
                              },),
                            ),
                          )
                        ),
                        title:Text(
                            message.username,
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        subtitle: Text(message.lastMessage,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(184, 34, 34, 34))),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ChatMainScreen(
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
              onPressed: () {},
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
