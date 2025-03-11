import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:tchat_frontend/src/animations/pageroute.dart';
import 'package:tchat_frontend/src/api/contacts.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/screens/chat.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<dynamic> _contacts = [];
  List<Contact> _inviteContacts = [];
  int totalTChatContacts = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (await FlutterContacts.requestPermission() && mounted) {
        List<dynamic> tchatContacts = await getTChatContacts(context);
        List<Contact> deviceContacts = await FlutterContacts.getContacts(withProperties: true);
        Set<String> tchatNumbers = tchatContacts.map((c) => c['mobileNumber'].toString()).toSet();
        List<Contact> inviteContacts = deviceContacts.where((contact) {
          String? phoneNumber = contact.phones.isNotEmpty ? contact.phones.first.number.replaceAll(" ", "") : null;
          return phoneNumber != null && !tchatNumbers.contains(phoneNumber);
        }).toList();

        if (mounted) {
          setState(() {
            _contacts = tchatContacts;
            _inviteContacts = inviteContacts;
            totalTChatContacts = tchatContacts.length;
            _isLoading = false;
          });
        }
      } else {
        debugPrint("Permission to access contacts was denied.");
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching contacts: $e");
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildTChatContactItem(dynamic contact, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: contact['details']['profilePicture'] != null &&
                      contact['details']['profilePicture'].isNotEmpty
                  ? NetworkImage(contact['details']['profilePicture'])
                  : const AssetImage('assets/images/user.jpg') as ImageProvider,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(createRoute(ChatScreen(username: contact['details']['name'], profileImage: contact['details']['profilePicture'], status: "Online"))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: contact['details']['name'],
                      weight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      text: contact['details']['about'] ??
                          contact['details']['about'],
                      size: 13,
                      color: grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInviteContactItem(Contact contact, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: contact.displayName,
                    weight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: contact.phones.isNotEmpty ? contact.phones.first.number : 'No Phone Number',
                    size: 13,
                    color: grey,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _sendInvite(contact);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const CustomText(text: "Invite", color: Colors.white, size: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomAppBar(message: "Search among $totalTChatContacts contacts", tab: ""),
            
            Expanded(
              child: _isLoading 
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
                          child: CustomText(
                            text: "Contacts on TChat", 
                            color: grey, 
                            size: 14, 
                            weight: FontWeight.w500
                          ),
                        ),
                      ),
                      
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _buildTChatContactItem(_contacts[index], index),
                          childCount: _contacts.length,
                        ),
                      ),
                      if (_inviteContacts.isNotEmpty)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                            child: CustomText(
                              text: "Invite Others on TChat", 
                              color: grey, 
                              size: 14, 
                              weight: FontWeight.w500
                            ),
                          ),
                        ),
                      
                      if (_inviteContacts.isNotEmpty)
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => _buildInviteContactItem(_inviteContacts[index], index),
                            childCount: _inviteContacts.length,
                          ),
                        ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendInvite(Contact contact) {
    snackmessage(context, "Invite sent successfully to ${contact.displayName}");
    debugPrint("Sending invite to ${contact.displayName}");
  }
}