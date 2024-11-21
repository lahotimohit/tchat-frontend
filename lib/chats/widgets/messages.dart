import "package:flutter/material.dart";
import "package:tchat_frontend/chats/models/chat.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";

Widget buildMessage(Message message, context) {
  final messageAlignment =
      message.isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  final messageColor =
      message.isSent ? Theme.of(context).colorScheme.primary.withOpacity(0.9) : Colors.white60;
  final textColor = message.isSent ? Colors.white : Colors.black87;
  final borderRadius = BorderRadius.only(
    topLeft: const Radius.circular(12),
    topRight: const Radius.circular(12),
    bottomLeft: message.isSent ? const Radius.circular(12) : const Radius.circular(0),
    bottomRight: message.isSent ? const Radius.circular(0) : const Radius.circular(12),
  );

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    child: Column(
      crossAxisAlignment: messageAlignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75),
          decoration: BoxDecoration(
            color: messageColor,
            borderRadius: borderRadius,
          ),
          child: Column(
            crossAxisAlignment: message.isSent
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                message.content,
                style: GoogleFonts.poppins(color: textColor, fontSize: 14),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: message.isSent
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('hh:mm a').format(message.timestamp),
                    style: GoogleFonts.poppins(
                        color: message.isSent ? Colors.white : Colors.grey,
                        fontSize: 12),
                  ),
                  if (message.isSent) ...[
                    const SizedBox(width: 4),
                    Icon(
                      message.isRead ? Icons.done_all : Icons.done,
                      size: 16,
                      color: message.isRead
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.grey,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
