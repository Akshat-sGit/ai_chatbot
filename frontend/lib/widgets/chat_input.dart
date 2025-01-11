import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _textController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ScrollController _scrollController = ScrollController(); // ScrollController to auto-scroll to the bottom

  Future<void> saveMessage(String message) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception("User not logged in.");
      }

      final userChatsRef = _firestore
          .collection('users') 
          .doc(user.uid) 
          .collection('chats'); 

      await userChatsRef.add({
        'message': message,
        'sender': user.email, 
        'time': FieldValue.serverTimestamp(), 
      });

      // After saving the message, scroll to the bottom to show the new message
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send message: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(
        bottom: 20.0 + bottomPadding,
        top: 10.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.10),
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: Colors.white),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14.0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onSubmitted: (value) async {
                        if (value.isNotEmpty) {
                          await saveMessage(value);  // Save message to Firestore
                          _textController.clear();  // Clear the text field after sending
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (_textController.text.isNotEmpty) {
                        String message = _textController.text.trim();
                        await saveMessage(message);  // Save message to Firestore
                        _textController.clear();  // Clear the text field after sending
                      }
                    },
                    icon: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_upward,
                        size: 24.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
