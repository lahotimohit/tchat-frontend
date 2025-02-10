import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/home/data/messages.dart';
import 'package:tchat_frontend/chats/screen/main.dart';
import 'package:tchat_frontend/home/widget/all_contacts.dart';
import 'package:tchat_frontend/home/widget/show_profile_image.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class MessageTab extends StatefulWidget {
  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: "TChat", size: 20, weight: FontWeight.w600,),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 45,
                  child: SearchBar(
                    hintText: "Search messages, people",
                    hintStyle: WidgetStateProperty.all<TextStyle>(
                      GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                        color: const Color.fromARGB(255, 174, 174, 174),
                      ),
                    ),
                     shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 230, 230, 230),
                          width: 1,
                        ),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 247, 248, 249)),
                    elevation: const WidgetStatePropertyAll(0),
                    leading: SvgPicture.asset("assets/svgs/magnifier.svg"),
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
                      return Row(
  children: [
    InkWell(
      onTap: () {
        showProfileImage(context, message.profileImage, message.username);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
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
                  'assets/images/user.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ),
    ),
    Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: message.username,
              letterspacing: 0.3,
              size: 16,
              weight: FontWeight.w500,
            ),
            CustomText(
              text: message.timestamp,
              letterspacing: 0.3,
              size: 10,
              color: grey,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(text: message.lastMessage, size: 13, letterspacing: 0.1 ,color: const Color.fromARGB(255, 63, 63, 63),),
            ),
            Row(
              children: [
                if (message.isPin ?? false)
                  SvgPicture.asset(
                    "assets/svgs/pin_filled.svg",
                    height: 15,
                    width: 15,
                  ),
                if (message.isMute ?? false)
                  const Icon(Icons.notifications_off, size: 15, color: grey),
                if (message.unread != null && message.unread! > 0)
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: CustomText(
                        text: message.unread! > 99 ? "99+" : message.unread.toString(),
                        size: 8,
                        color: white,
                        align: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ChatMainScreen(
                      username: message.username,
                      profileImage: message.profileImage,
                      status: "Online",
                    ),
                  ));
                },
              ),
            ),
          ],
        );
                    },
                  ),
                ),
              ],
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ContactsScreen()));
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset("assets/svgs/new_chat.svg", height: 25, width: 25),
        ),
    );
  }
}