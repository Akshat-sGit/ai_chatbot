import 'package:ai_chatbot/core/theme/app_theme.dart';
import 'package:ai_chatbot/firebase_options.dart';
import 'package:ai_chatbot/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chatbot',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home:const WelcomeScreen(),
    );
  }
}