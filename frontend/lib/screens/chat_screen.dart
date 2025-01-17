// ignore_for_file: library_private_types_in_public_api

import 'package:ai_chatbot/screens/welcome_screen.dart';
import 'package:ai_chatbot/widgets/chat_input.dart';
import 'package:ai_chatbot/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ScrollController _scrollController =
      ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    if (user == null) {
      return const WelcomeScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'AI Chatbot',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('users')
                      .doc(user.uid)
                      .collection('chats')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  builder: (ctx, chatSnapshot) {
                    if (chatSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final chatDocs = chatSnapshot.data?.docs ?? [];

                    return ListView.builder(
                      controller:
                          _scrollController, // Attach the ScrollController
                      reverse: true, // So messages appear in the correct order
                      itemCount: chatDocs.length,
                      itemBuilder: (ctx, index) {
                        final chatData = chatDocs[index];
                        final message = chatData['message'] ?? '';
                        final sender = chatData['sender'] ?? '';
                        final isMe = sender == user.email;

                        // Safe way to check and convert the timestamp
                        final timestamp = chatData['time'];
                        DateTime dateTime;
                        if (timestamp is Timestamp) {
                          dateTime = timestamp.toDate(); // Convert to DateTime
                        } else {
                          dateTime =
                              DateTime.now(); // Default to now if invalid
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth > 600 ? 100 : 10,
                          ), // Add padding for larger screens
                          child: MessageBubble(
                            isMe: isMe,
                            message: message,
                            senderName: sender,
                            timestamp: dateTime,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth > 600 ? 100 : 10,
                ), // Adjust input padding for larger screens
                child: ChatInput(
                  onMessageSent: (message) =>
                      _scrollToBottom(), // Match the required signature
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



