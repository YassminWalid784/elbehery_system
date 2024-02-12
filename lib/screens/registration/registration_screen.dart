import 'package:elbehery_system/screens/registration/textfields.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "register";
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool _isObscure = true;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    // Add more validation criteria as needed
    return null;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              const Text(
                "Create Your Account",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              const SizedBox(
                height: 32,
              ),
              // from

              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SignUpTextField(
                            controller: firstNameEditingController,
                            text: 'First Name',
                            hinttext: 'First Name',
                            icon: Icons.person,
                            obscureText: false, // No need for an icon here
                            toggleVisibility: () {},
                          ),

                        ),
                        Expanded(
                          child: SignUpTextField(
                            controller: secondNameEditingController,
                            hinttext: 'Second Name',
                            text: 'Second Name',
                            obscureText: false, // No need for an icon here
                            toggleVisibility: () {},
                            icon: Icons.person,
                          ),
                        ),
                      ],
                    ),
                    SignUpTextField(
                      controller: secondNameEditingController,
                      hinttext: 'Phone Number',
                      text: 'Phone Number',
                      obscureText: false, // No need for an icon here
                      toggleVisibility: () {},
                      icon: Icons.phone,
                    ),

                    SignUpTextField(
                      controller: emailEditingController,
                      hinttext: 'Email',
                      text: 'Email',
                      obscureText: false, // No need for an icon here
                      toggleVisibility: () {},
                      icon: Icons
                          .alternate_email, // No action for toggling visibility
                    ),
                    SignUpTextField(
                      controller: passwordEditingController,
                      hinttext: 'Password',
                      text: 'Password',
                      obscureText: _isObscure, // Pass the state variable here
                      toggleVisibility: _toggleVisibility,
                      icon: Icons.lock_outline,
                      validator: validatePassword, // Pass the validation function
                    ),
                    SignUpTextField(
                      controller: confirmPasswordEditingController,
                      hinttext: 'Password',
                      text: 'Confirm Password',
                      obscureText: _isObscure, // Pass the state variable here
                      toggleVisibility: _toggleVisibility,
                      icon: Icons.lock_outline,
                      validator: validatePassword, // Pass the validation function
                    ),
// sign up button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: const Text("Sign Up",
                       style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
