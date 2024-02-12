import 'package:elbehery_system/screens/registration/textfields.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  static const String routeName = "register";
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  // final firstNameEditingController = TextEditingController();
  // final secondNameEditingController = TextEditingController();
  // final emailEditingController = TextEditingController();
  String? name;
  String? secondname;
  String? email;
  String? phone;

  //final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool _isObscure = true;
  //
  // String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password is required';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters long';
  //   }
  //   // Add more validation criteria as needed
  //   return null;
  // }

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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),                  child: SignUpTextField(
                    // controller: name,
                    text: 'First Name',
                    hinttext: 'First Name',
                    icon: Icons.person,
                    obscureText: false, // No need for an icon here
                    toggleVisibility: () {},
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: SignUpTextField(
                    //controller: secondname,
                    hinttext: 'Second Name',
                    text: 'Second Name',
                    obscureText: false,
                    toggleVisibility: () {},
                    icon: Icons.person,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: SignUpTextField(
                    //controller: emailEditingController,
                    hinttext: 'Email',
                    text: 'Email',
                    obscureText: false, // No need for an icon here
                    toggleVisibility: () {},
                    icon: Icons.alternate_email,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      email = value;
                    },
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: SignUpTextField(
                    //controller: secondNameEditingController,
                    hinttext: 'Phone Number',
                    text: 'Phone Number',
                    obscureText: false, // No need for an icon here
                    toggleVisibility: () {},
                    icon: Icons.phone,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      phone = value;
                    },
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: SignUpTextField(
                    controller: passwordEditingController,
                    hinttext: 'Password',
                    text: 'Password',
                    obscureText: _isObscure,
                    toggleVisibility: _toggleVisibility,
                    icon: Icons.lock_outline,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      // Implement your logic here when the field is saved
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SignUpTextField(
                    controller: confirmPasswordEditingController,
                    hinttext: 'Confirm Password',
                    text: 'Confirm Password',
                    obscureText: _isObscure,
                    toggleVisibility: _toggleVisibility,
                    icon: Icons.lock_outline,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter the password';
                      }
                      if (passwordEditingController.text != value) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    // validator: validatePassword, // Pass the validation function
                  ),
                ),
                //   // sign up button
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("Successful");
                      } else {
                        print("Unsuccessful");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
