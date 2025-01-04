import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  
  final String message; 
  final bool isMe; 

  const MessageBubble({super.key, required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft, 
      child: Container(
        padding:const EdgeInsets.all(10), 
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), 
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.green,
          borderRadius:const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15)), 
        ),
        child: Text(
          message, 
          style: TextStyle(color: isMe ? Colors.white: Colors.black),
        ),
      ),
    );
  }
}