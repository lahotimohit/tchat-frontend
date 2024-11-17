import 'package:flutter/material.dart';
import 'package:tchat_frontend/home/models/messages.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesTab extends StatelessWidget {
  final List<Message> messages = [
    Message(
      username: 'Frank Martin',
      lastMessage: 'Hello Brother...',
      timestamp: 'now',
      profileImage:
          'https://images.unsplash.com/photo-1624140716840-5d89f311f500?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Message(
      username: 'Marta Popaes',
      lastMessage: 'Nice to meet you!',
      timestamp: '10:30 PM',
      profileImage:
          'https://cdn.pixabay.com/photo/2023/01/24/13/23/viet-nam-7741019_1280.jpg',
    ),
    Message(
      username: 'Theresa',
      lastMessage: 'TChat is awesome app...',
      timestamp: 'Yesterday',
      profileImage:
          'https://cdn.pixabay.com/photo/2022/04/30/14/04/woman-7165664_1280.jpg',
    ),
    Message(
      username: 'Frank Martin',
      lastMessage: 'Hello Brother...',
      timestamp: 'now',
      profileImage:
          'https://images.unsplash.com/photo-1624140716840-5d89f311f500?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Message(
      username: 'Marta Popaes',
      lastMessage: 'Nice to meet you!',
      timestamp: '10:30 PM',
      profileImage:
          'https://cdn.pixabay.com/photo/2023/01/24/13/23/viet-nam-7741019_1280.jpg',
    ),
    Message(
      username: 'Theresa',
      lastMessage: 'TChat is awesome app...',
      timestamp: 'Yesterday',
      profileImage:
          'https://cdn.pixabay.com/photo/2022/04/30/14/04/woman-7165664_1280.jpg',
    ),
    Message(
      username: 'Frank Martin',
      lastMessage: 'Hello Brother...',
      timestamp: 'now',
      profileImage:
          'https://images.unsplash.com/photo-1624140716840-5d89f311f500?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Message(
      username: 'Marta Popaes',
      lastMessage: 'Nice to meet you!',
      timestamp: '10:30 PM',
      profileImage:
          'https://cdn.pixabay.com/photo/2023/01/24/13/23/viet-nam-7741019_1280.jpg',
    ),
    Message(
      username: 'Theresa',
      lastMessage: 'TChat is awesome app...',
      timestamp: 'Yesterday',
      profileImage:
          'https://cdn.pixabay.com/photo/2022/04/30/14/04/woman-7165664_1280.jpg',
    ),
    Message(
      username: 'Frank Martin',
      lastMessage: 'Hello Brother...',
      timestamp: 'now',
      profileImage:
          'https://images.unsplash.com/photo-1624140716840-5d89f311f500?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Message(
      username: 'Marta Popaes',
      lastMessage: 'Nice to meet you!',
      timestamp: '10:30 PM',
      profileImage:
          'https://cdn.pixabay.com/photo/2023/01/24/13/23/viet-nam-7741019_1280.jpg',
    ),
    Message(
      username: 'Theresa',
      lastMessage: 'TChat is awesome app...',
      timestamp: 'Yesterday',
      profileImage:
          'https://cdn.pixabay.com/photo/2022/04/30/14/04/woman-7165664_1280.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              backgroundColor: Color.fromARGB(255, 91, 131, 242),
              child: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
