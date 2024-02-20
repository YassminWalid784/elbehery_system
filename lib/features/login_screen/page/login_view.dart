import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field.dart';
import '../../registration/page/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    //var vm = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50,),
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
                    SizedBox(height: mediaQuery.height * 0.10),
                    Text(
                      "Welcome back!",
                      textAlign: TextAlign.start,
                      style:
                      theme.textTheme.titleLarge?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Username",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(
                      controller: usernameController,
                      hint: "Enter your username",
                      hintColor: Colors.black87,
                      suffixWidget: const Icon(Icons.email_rounded),
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your username";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Password",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      maxLines: 1,
                      hint: "Enter your password",
                      hintColor: Colors.black87,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 8.0),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Logged in successfully");
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Login",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OR",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RegisterView.routeName,
                            );
                          },
                          child: Text(
                            "Create new account !",
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
