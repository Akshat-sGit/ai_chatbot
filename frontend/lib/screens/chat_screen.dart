import 'package:ai_chatbot/widgets/chat_input.dart';
import 'package:ai_chatbot/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'AI Chatbot',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text(
                      'Hello',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Hi',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      child: Text('AI'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'How are you?',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'I am fine',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      child: Text('AI'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'What is your name?',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'I am AI',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      child: Text('AI'),
                    ),
                  ),
                  MessageBubble(isMe: true, message: "hi hello how are you"),
                  MessageBubble(
                      isMe: false, message: "Hello I am not fine I am just ai"),
                ],
              ),
            ),
            const ChatInput(),
          ],
        ));
  }
}
