import 'package:ai_chatbot/screens/welcome_screen.dart';
import 'package:ai_chatbot/widgets/chat_input.dart';
import 'package:ai_chatbot/widgets/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          leading: IconButton(
            icon: const Icon(Icons.messenger_rounded),
            onPressed: () {
              // handle back action
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // Navigate after logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                );
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView(
                children: const [
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
