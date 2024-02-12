import 'package:flutter/material.dart';

import '../registration/registration.dart';
import '../registration/registration_screen.dart';

class Buttons extends StatelessWidget {
  final String text;
  const Buttons({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.0,
      child: ElevatedButton(
          onPressed: () {
            if (text == 'Sign Up') {
              Navigator.pushNamed(context, '/home');
            } else if (text == 'Create a New Account') {
              Navigator.pushNamed(context, Registration.routeName);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }
}
