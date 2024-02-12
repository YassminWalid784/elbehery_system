import 'package:flutter/material.dart';

class SignUpTextField extends StatefulWidget {
  const SignUpTextField({
    Key? key,
    required this.hinttext,
    this.controller,
    required this.obscureText,
    required this.toggleVisibility,
    required this.text,
    required this.icon,
    this.validator, this.onSaved,
  }) : super(key: key);

  final String hinttext;
  final String text;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;
  final VoidCallback toggleVisibility;
  final String? Function(String?)?validator; // Validator parameter defined here
  final void Function(String?)? onSaved;

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  bool _obscureText = true;
  String? _errorText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        expands: false,
        controller: widget.controller,
        obscureText: widget.obscureText, // Use local state to toggle visibility
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: const TextStyle().copyWith(fontSize: 16),
          prefixIcon: Icon(widget.icon),
          suffixIcon:  widget.hinttext.toLowerCase() == 'password'
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
              widget.toggleVisibility();
            },
          )
              : widget.hinttext.toLowerCase() == 'confirm password'
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
              widget.toggleVisibility();
            },
          )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Adjust padding around label text
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hinttext,
          hintStyle: TextStyle(color: Colors.grey[500]),
          errorText: _errorText,
        ),
        onChanged: (value) {
          if (widget.hinttext.toLowerCase() == "email" &&
              !isValidEmail(value)) {
            setState(() {
              _errorText = 'Enter a valid email address';
            });
          } else {
            setState(() {
              _errorText = null;
            });
          }
        },
       // onSaved: widget.onSaved,
      ),
    );
  }

  bool isValidEmail(String email) {
    // Regular expression for simple email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
