import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "Please enter password";
        } else if (password.length < 8) {
          return 'Password must contain 8 characters';
        } else if (!(password.contains(RegExp(r'[A-Z]')))) {
          return 'Password must contain least 1 capital letter';
        } else if (!(password.contains(RegExp(r'[a-z]')))) {
          return 'Password must contain least 1 small letter';
        } else if (!(password.contains(RegExp(r'[0-9]')))) {
          return 'Password must contain least 1 numeric';
        } else if (!(password.contains(RegExp(r'''[!@#$%^&*()',.?":{}|<>]''')))) {
          return 'Password must contain least 1 special character';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: 'Password',
      ),
    );
  }
}
