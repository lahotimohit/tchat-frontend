import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/setting/models/profile_option.dart';

class SettingMainScreen extends StatelessWidget {
  SettingMainScreen({super.key});

    final List<ProfileOption> options = [
    ProfileOption(icon: Icons.key, title: 'Account', subtitle: "Security notifications, change number"),
    ProfileOption(icon: Icons.insert_emoticon, title: 'Avatar', subtitle: "Create, edit, profile photo"),
    ProfileOption(icon: Icons.chat, title: 'Chats', subtitle: "Theme, wallpapers, chat history"),
    ProfileOption(icon: Icons.notifications, title: 'Notifications', subtitle: "Message, group & call tones"),
    ProfileOption(icon: Icons.lock, title: 'Privacy', subtitle: "Block Contacts, disapearing messages"),
    ProfileOption(icon: Icons.storage, title: 'Data & Storage', subtitle: "Network usage, auto-download"),
    ProfileOption(icon: Icons.help, title: 'Help', subtitle: "Help center, contact us, privacy policy"),
    ProfileOption(icon: Icons.language, title: 'App language', subtitle: "English (device's language)"),
    ProfileOption(icon: Icons.person, title: 'Invite a friend', subtitle: ""),
    ProfileOption(icon: Icons.update, title: 'App Updates', subtitle: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        title: Text("Settings",
        style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 18, fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white,))
        ]
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              const CircleAvatar(
                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2019/08/28/17/17/girl-4437225_640.jpg",),
                        radius: 40,
                      ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Mark Sacca",
                  style: GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text("A warm smile is the key to success.",
                  style: GoogleFonts.raleway(fontSize: 14),)
                ],),
              )
            ],),
            const Divider(color: Colors.grey, thickness: 0.4,),
            Expanded(
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder: (context, index) => SizedBox.shrink(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    options[index].icon,
                    color: Colors.grey[800],
                  ),
                  title: Text(
                    options[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: options[index].subtitle.isNotEmpty
            ? Text(
                options[index].subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              )
            : null,
                  onTap: () {},
                );
              },
            ),
          ),
          ],),
        ),
      );
  }
}