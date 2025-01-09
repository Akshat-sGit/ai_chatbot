import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<String> fetchGeneratedPrompt(String prompt) async {
  const String apiUrl = "http://127.0.0.1:5000/generate"; // Replace with your machine's IP
  final dio = Dio();

  try {
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
      // Parse the response to extract the generated text
      final data = response.data;
      final candidates = data["candidates"] as List<dynamic>;
      if (candidates.isNotEmpty) {
        final content = candidates[0]["content"]["parts"][0]["text"];
        return content;
      } else {
        return "No text generated.";
      }
    } else {
      throw Exception("Failed to generate prompt: ${response.statusCode}");
    }
  } catch (e) {
    return "Failed to generate prompt: $e";
  }
}

void handleGenerateText() async {
  String prompt = "Write a haiku about Flutter";
  String result = await fetchGeneratedPrompt(prompt);
  debugPrint("Generated text: $result");
}