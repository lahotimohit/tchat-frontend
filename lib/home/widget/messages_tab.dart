import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tchat_frontend/home/data/messages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/home/widget/appbar.dart';
import 'package:tchat_frontend/home/widget/drawer.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.primary,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light
    ));
    return Scaffold(
        appBar: const MainAppBar(title: "Conversations",),
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
                    separatorBuilder: (context, index) => SizedBox.shrink(),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ListTile(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 3),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(message.profileImage),
                          radius: 25,
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
                        onTap: () {},
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
