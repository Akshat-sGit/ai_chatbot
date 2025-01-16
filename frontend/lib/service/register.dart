import 'package:flutter/material.dart';

class RegisterService {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  /// Validates user inputs and shows errors if invalid
  bool validateInputs(BuildContext context) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar(context, "All fields are required.", Colors.redAccent);
      return false;
    }
    if (password != confirmPassword) {
      _showSnackBar(context, "Passwords do not match.", Colors.redAccent);
      return false;
    }
    return true;
  }

  /// Displays a snackbar with the provided message and background color
  void _showSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.black)),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}