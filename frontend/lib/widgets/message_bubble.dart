import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String senderName; // Sender's name for initials
  final DateTime timestamp; // Timestamp for the message

  const MessageBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.senderName,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // Row for the Avatar and Message Bubble
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Circle Avatar for AI on the left
            if (!isMe)
              const Padding(
                padding:  EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child:  Text(
                    'AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // Chat Bubble
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isMe ? Colors.white : Colors.grey[800],
                borderRadius: isMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
              ),
              constraints: BoxConstraints(
                maxWidth: isMe ? width * 0.35 : width * 0.65,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // Use MarkdownBody to properly render bold and other markdown syntax
                  MarkdownBody(
                    data: message,
                    styleSheet: MarkdownStyleSheet(
                      p: TextStyle(
                        color: isMe ? Colors.black : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Circle Avatar for the User on the right
            if (isMe)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    senderName[0].toUpperCase(), // First initial of the user's name
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),

        // Time below the chat bubble
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0, // Aligning to left for AI
            right: 8.0, // Aligning to right for user
            top: 4.0,
          ),
          child: Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              DateFormat('hh:mm a').format(timestamp),
              style: const TextStyle(
                fontSize: 10,
                color:  Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
