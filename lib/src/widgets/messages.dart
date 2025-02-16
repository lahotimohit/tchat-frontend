import "package:flutter/material.dart";
import "package:tchat_frontend/src/models/chat.dart";
import "package:tchat_frontend/src/common.dart";
import "package:tchat_frontend/src/widgets/custom_text.dart";

Widget buildMessage(Message message, context) {

  return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment:
            message.isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.65,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: message.isSent ? const Color.fromARGB(255, 227, 242, 253) : white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: 
                    Text(
                      message.content,
                      style: customTextStyle(14, null, null)
                    ),
                  ),
                  const SizedBox(width: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(text: message.timestamp, size: 12, color: const Color.fromARGB(255, 173, 173, 173),),
                      if (message.isSent && message.isRead) 
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.done_all,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      if (message.isSent && !message.isRead)
                      const Icon(
                            Icons.done_all,
                            size: 16,
                            color: grey,
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}
