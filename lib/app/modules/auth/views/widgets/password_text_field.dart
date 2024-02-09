import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.obscureText,
    required this.onTapSuffix,
  });

  final TextEditingController passwordController;

  final bool obscureText;
  final VoidCallback onTapSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: 'Enter Password',
        suffixIcon: IconButton(
          onPressed: onTapSuffix,
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey, // Customize the icon color as needed
          ),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Enter A Strong password';
        } else if (value!.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
    );
  }
}
