import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchat_frontend/chats/models/chat.dart';

void _openBottomSheet(
    BuildContext context, Function(String, MessageType) onNewMessage) {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      print('Image path: ${image.path}');
      // Send the image as a new message with MessageType.image
      onNewMessage(image.path, MessageType.image);
    }
    Navigator.of(context).pop();
  }

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
              onTap: () => _pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      );
    },
  );
}

class buildMessageInputField extends StatefulWidget {
  const buildMessageInputField({super.key, required this.onNewMessage});
  final Function(String, MessageType) onNewMessage;
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
      margin: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 55,
            child: Card(
              color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
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
                    icon: const Icon(Icons.emoji_emotions_outlined),
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _openBottomSheet(context, widget.onNewMessage);
                        },
                        icon: const Icon(Icons.attach_file),
                      ),
                      IconButton(
                        onPressed: () {
                          _openBottomSheet(context, widget.onNewMessage);
                        },
                        icon: const Icon(Icons.camera_alt_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8, right: 2),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                onPressed: () {
                  widget.onNewMessage(
                    messageController.text,
                    MessageType.text,
                  );
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
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
