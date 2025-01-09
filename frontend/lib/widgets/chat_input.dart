import 'package:ai_chatbot/service/prompt_generator.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _textController = TextEditingController();

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 14.0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        border: InputBorder.none,
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        fetchGeneratedPrompt(_textController.text); 
                        _textController.clear();
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
