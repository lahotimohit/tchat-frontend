import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts =
          await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        _contacts = contacts;
      });
    } else {
      debugPrint("Permission to access contacts was denied.");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(searchHint: "Search among ${_contacts.length} contacts", tab: ""),
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 8, bottom: 8),
              child: CustomText(text: "Contacts on TChat", color: grey, size: 14, weight: FontWeight.w500,)
            ),
            Expanded(
              child: _contacts.isEmpty
                  ? const Center(
                      child: CustomText(text: "No contacts available", color: grey, alignment: Alignment.center,)
                    )
                  : Scrollbar(
                      child: ListView.builder(
                        itemCount: _contacts.length,
                        itemBuilder: (context, index) {
                          Contact contact = _contacts[index];
                          return ListTile(
                            leading:
                                CircleAvatar(child: Image.asset('assets/images/user.jpg')),
                            title: CustomText(text: contact.displayName, weight: FontWeight.w500, overflow: TextOverflow.ellipsis,),
                            subtitle: CustomText(text: contact.phones.isNotEmpty
                                ? contact.phones.first.number
                                : 'No Phone Number', size: 13, color: grey,),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
