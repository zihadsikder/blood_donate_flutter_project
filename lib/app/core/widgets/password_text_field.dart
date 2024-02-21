import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.obscureText,
    required this.onTapSuffix, required this.suffixIcon,
  });

  final TextEditingController passwordController;

  final bool obscureText;
  final VoidCallback onTapSuffix;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          onPressed: onTapSuffix,
          icon:suffixIcon
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
