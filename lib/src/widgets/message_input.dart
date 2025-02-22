import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchat_frontend/src/models/chat.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

void _openBottomSheet(
    BuildContext context, Function(String, MessageType) onNewMessage) {
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      onNewMessage(image.path, MessageType.image);
    }
    context.mounted? Navigator.of(context).pop(): null;
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
              onTap: () => pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () => pickImage(ImageSource.gallery),
            ),
          ],
        ),
      );
    },
  );
}

class BuildMessageInputField extends StatefulWidget {
  const BuildMessageInputField({super.key, required this.onNewMessage});
  final Function(String, MessageType) onNewMessage;
  @override
  State<BuildMessageInputField> createState() => _BuildMessageInputFieldState();
}

class _BuildMessageInputFieldState extends State<BuildMessageInputField> {
  bool _hasFocus = false;

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: const Color.fromARGB(255, 245, 245, 245),
      margin: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 65,
            child: Container(
              margin: const EdgeInsets.only(left: 3, right: 2, bottom: 3),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 232, 236, 244)),
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 245, 245, 245),
              ),
              child: TextFormField(
  controller: messageController,
  maxLines: 5,
  minLines: 1,
  onChanged: (value) {
    setState(() {
      _hasFocus = value.isNotEmpty;
    });
  },
  keyboardType: TextInputType.multiline,
  decoration: InputDecoration(
    hintText: "Message",
    hintStyle: customTextStyle(14, const Color.fromARGB(255, 144, 144, 144), FontWeight.w500),
    border: InputBorder.none,
    prefixIcon: Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: 20,
        height: 20,
        child: SvgPicture.asset("assets/svgs/smile_sticker.svg"),
      ),
    ),
    suffixIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: SvgPicture.asset("assets/svgs/attach_small.svg", width: 20, height: 20),
          onTap: () {
            _openBottomSheet(context, widget.onNewMessage);
          },
        ),
        const SizedBox(width: 10),
        InkWell(
          child: SvgPicture.asset("assets/svgs/camera_small.svg", width: 20, height: 20),
          onTap: () {},
        ),
        const SizedBox(width: 10),
      ],
    ),
  ),
)

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8, right: 2),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: _hasFocus ?
              InkWell(child: SvgPicture.asset("assets/svgs/forward.svg"),
              onTap: () {
                if(messageController.text.isNotEmpty)
                {
                  widget.onNewMessage(
                      messageController.text,
                      MessageType.text,
                    );
                  messageController.text = "";
                }
                },) :
                InkWell(child: SvgPicture.asset("assets/svgs/microphone.svg"),
              onTap: () {},)
            ),
          ),
        ],
      ),
    );
  }
}
