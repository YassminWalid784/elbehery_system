import 'package:elbehery_system/screens/login_screen/buttons.dart';
import 'package:elbehery_system/screens/login_screen/spacing_styles.dart';
import 'package:elbehery_system/screens/login_screen/textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});
  static const String routeName = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/photo.jpg",
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                child: Column(
                  children: [
                    UserTextField(
                      controller: usernameController,
                      hinttext: 'Email',
                      obscureText: false, // No need for an icon here
                      toggleVisibility:
                          () {}, // No action for toggling visibility
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //password
                    UserTextField(
                      controller: passwordController,
                      hinttext: 'Password',
                      obscureText: _isObscure, // Pass the state variable here
                      toggleVisibility: _toggleVisibility, // Pass the toggle function here
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Buttons(text: "Log In"),
                    const SizedBox(
                      height: 10,
                    ),
                    Buttons(text: "Create a New Account"),
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
