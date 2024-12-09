import 'package:flutter/material.dart';

void _openBottomSheet(context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: const Text('Documents'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.mic),
              title: const Text('Audio'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

class buildMessageInputField extends StatefulWidget {
  const buildMessageInputField({super.key, required this.onNewMessage});
  final Function(String) onNewMessage;
  @override
  State<buildMessageInputField> createState() => _buildMessageInputFieldState();
}

class _buildMessageInputFieldState extends State<buildMessageInputField> {
  bool _hasFocus = false;

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 55,
            child: Card(
              color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: TextFormField(
                controller: messageController,
                maxLines: 5,
                minLines: 1,
                onChanged: (value) {
                  value.isNotEmpty
                      ? setState(() {
                          _hasFocus = true;
                        })
                      : setState(() {
                          _hasFocus = false;
                        });
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Type a message",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions_outlined)),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _openBottomSheet(context);
                          },
                          icon: const Icon(Icons.attach_file),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8, right: 2),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                  onPressed: () {
                    widget.onNewMessage(messageController.text);
                    messageController.text = "";
                  },
                  icon: _hasFocus
                      ? const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        )
                      : const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 22,
                        )),
            ),
          )
        ],
      ),
    );
  }
}
