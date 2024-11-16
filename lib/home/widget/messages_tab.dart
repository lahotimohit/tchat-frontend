import 'package:flutter/material.dart';
import 'package:tchat_frontend/home/models/messages.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesTab extends StatelessWidget {
  final List<Message> messages = [
    Message(
      username: 'Thala',
      lastMessage: 'Oye Kal match hai...',
      timestamp: 'now',
      profileImage:
          'https://images.firstpost.com/uploads/2024/02/MS-Dhoni-CSK-IPL-2023-PTI-1200-2024-02-9c8c7d515e57c707fd33cef140b5d687.jpg?im=FitAndFill=(1200,675)',
    ),
    Message(
      username: 'Chokli',
      lastMessage: 'Yaar RCB chodne ka man kar rha hai...',
      timestamp: '10:30 PM',
      profileImage:
          'https://www.hindustantimes.com/static-content/1y/cricket-logos/players/virat-kohli.png',
    ),
    Message(
      username: 'Pandu Bhai',
      lastMessage: 'Bhai Shaadi ka kuch jugad hua?',
      timestamp: 'Yesterday',
      profileImage:
          'https://img.mensxp.com/media/content/2022/Mar/Pandya-Isnt-Considering-IPL-2022-As-Comeback1200_6236fe21d8df5.jpeg',
    ),
    Message(
      username: 'Thala',
      lastMessage: 'Oye Kal match hai...',
      timestamp: 'now',
      profileImage:
          'https://images.firstpost.com/uploads/2024/02/MS-Dhoni-CSK-IPL-2023-PTI-1200-2024-02-9c8c7d515e57c707fd33cef140b5d687.jpg?im=FitAndFill=(1200,675)',
    ),
    Message(
      username: 'Chokli',
      lastMessage: 'Yaar RCB chodne ka man kar rha hai...',
      timestamp: '10:30 PM',
      profileImage:
          'https://www.hindustantimes.com/static-content/1y/cricket-logos/players/virat-kohli.png',
    ),
    Message(
      username: 'Pandu Bhai',
      lastMessage: 'Bhai Shaadi ka kuch jugad hua?',
      timestamp: 'Yesterday',
      profileImage:
          'https://img.mensxp.com/media/content/2022/Mar/Pandya-Isnt-Considering-IPL-2022-As-Comeback1200_6236fe21d8df5.jpeg',
    ),
    Message(
      username: 'Thala',
      lastMessage: 'Oye Kal match hai...',
      timestamp: 'now',
      profileImage:
          'https://images.firstpost.com/uploads/2024/02/MS-Dhoni-CSK-IPL-2023-PTI-1200-2024-02-9c8c7d515e57c707fd33cef140b5d687.jpg?im=FitAndFill=(1200,675)',
    ),
    Message(
      username: 'Chokli',
      lastMessage: 'Yaar RCB chodne ka man kar rha hai...',
      timestamp: '10:30 PM',
      profileImage:
          'https://www.hindustantimes.com/static-content/1y/cricket-logos/players/virat-kohli.png',
    ),
    Message(
      username: 'Pandu Bhai',
      lastMessage: 'Bhai Shaadi ka kuch jugad hua?',
      timestamp: 'Yesterday',
      profileImage:
          'https://img.mensxp.com/media/content/2022/Mar/Pandya-Isnt-Considering-IPL-2022-As-Comeback1200_6236fe21d8df5.jpeg',
    ),
    Message(
      username: 'Thala',
      lastMessage: 'Oye Kal match hai...',
      timestamp: 'now',
      profileImage:
          'https://images.firstpost.com/uploads/2024/02/MS-Dhoni-CSK-IPL-2023-PTI-1200-2024-02-9c8c7d515e57c707fd33cef140b5d687.jpg?im=FitAndFill=(1200,675)',
    ),
    Message(
      username: 'Chokli',
      lastMessage: 'Yaar RCB chodne ka man kar rha hai...',
      timestamp: '10:30 PM',
      profileImage:
          'https://www.hindustantimes.com/static-content/1y/cricket-logos/players/virat-kohli.png',
    ),
    Message(
      username: 'Pandu Bhai',
      lastMessage: 'Bhai Shaadi ka kuch jugad hua?',
      timestamp: 'Yesterday',
      profileImage:
          'https://img.mensxp.com/media/content/2022/Mar/Pandya-Isnt-Considering-IPL-2022-As-Comeback1200_6236fe21d8df5.jpeg',
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
          : ListView.separated(
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
                  title: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (ctx) => ChatScreen(
                      //           username: message.username,
                      //           status: "Online",
                      //           profilephoto: message.profileImage,
                      //         )));
                    },
                    child: Text(
                      message.username,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  subtitle: Text(message.lastMessage,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(184, 34, 34, 34))),
                  trailing: Text(
                    message.timestamp,
                    style: TextStyle(
                        color: Color.fromARGB(255, 157, 157, 157),
                        fontSize: 12),
                  ),
                  onTap: () {},
                );
              },
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
