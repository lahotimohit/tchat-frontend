import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/animations/pageroute.dart';
import 'package:tchat_frontend/src/providers/messages.dart';
import 'package:tchat_frontend/home/widget/all_contacts.dart';
import 'package:tchat_frontend/home/widget/show_profile_image.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/screens/chat.dart';
import 'package:tchat_frontend/src/widgets/empty_tab.dart';

class MessageTab extends StatefulWidget {
  const MessageTab({super.key});
  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: messages.isEmpty? emptyTab("Send your first message first", "assets/svgs/empty_message.svg")
      :Column(
              children: [
                const CustomAppBar(searchHint: "Search messages, people", tab: "messages",),
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
                  Navigator.of(context).push(
                    createRoute(ChatScreen(username: message.username, profileImage: message.profileImage, status: "Online")));
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
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ContactsScreen()));
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset("assets/svgs/new_chat.svg", height: 25, width: 25),
        ),
    );
  }
}