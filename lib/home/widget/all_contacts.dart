import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Column(
          children: [
            Text("Select Contact",
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 14)),
            Text(
              "${_contacts.length} contacts",
              style: GoogleFonts.raleway(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.white70)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
            child: Text(
              "Contacts on TChat",
              style: GoogleFonts.poppins(
                  color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: _contacts.isEmpty
                ? Center(
                    child: Text(
                      "No contacts available",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                  )
                : Scrollbar(
                    child: ListView.builder(
                      itemCount: _contacts.length,
                      itemBuilder: (context, index) {
                        Contact contact = _contacts[index];
                        return ListTile(
                          leading:
                              const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(contact.displayName),
                          subtitle: Text(contact.phones.isNotEmpty
                              ? contact.phones.first.number
                              : 'No Phone Number'),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
