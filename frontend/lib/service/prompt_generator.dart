import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<String> fetchGeneratedPrompt(String prompt) async {
  const String apiUrl = "http://127.0.0.1:5001/generate"; 
  final dio = Dio();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    // Send the request to the API
    Response response = await dio.post(
      apiUrl,
      data: {"prompt": prompt},
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final candidates = data["candidates"] as List<dynamic>;
      if (candidates.isNotEmpty) {
        final content = candidates[0]["content"]["parts"][0]["text"];

        final user = auth.currentUser;
        if (user == null) {
          throw Exception("User not logged in.");
        }

        final userChatsRef = firestore
            .collection('users') 
            .doc(user.uid)
            .collection('chats');

        await userChatsRef.add({
          'message': content,
          'sender': 'AI',
          'time': FieldValue.serverTimestamp(),
        });

        return content;
      } else {
        debugPrint("No text generated.");
        return "No text generated.";
      }
    } else {
      debugPrint("Failed to generate prompt: ${response.statusCode}");
      throw Exception("Failed to generate prompt: ${response.statusCode}");
    }
  } catch (e) {
    debugPrint("Failed to generate prompt: $e");
    return "Failed to generate prompt: $e";
  }
}
