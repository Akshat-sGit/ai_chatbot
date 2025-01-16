import 'package:ai_chatbot/screens/welcome_screen.dart';
import 'package:ai_chatbot/service/signin.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SignInService _signInService = SignInService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
        ),
      ),
      body: _signInService.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop(context) ? 200 : 16,
                vertical: isDesktop(context) ? 50 : 16,
              ),
              child: isDesktop(context)
                  ? Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Add your widgets here
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildSignInForm(context),
                        ),
                      ],
                    )
                  : _buildSignInForm(context),
            ),
    );
  }

  Widget _buildSignInForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _signInService.emailController,
          decoration: const InputDecoration(
            labelText: "Email",
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _signInService.passwordController,
          decoration: const InputDecoration(
            labelText: "Password",
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () => _signInService.signInUser(context),
          child: const Text(
            "Sign In",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}