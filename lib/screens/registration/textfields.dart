import 'package:flutter/material.dart';

class UserTextField extends StatefulWidget {
  const UserTextField({
    super.key,
    required this.hinttext,
    this.controller,
    required this.obscureText,
    required this.toggleVisibility,
  });
  final String hinttext;
  final TextEditingController? controller;
  final bool obscureText;
  final VoidCallback toggleVisibility;

  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
   bool _obscureText = true;
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
        controller: widget.controller,
        obscureText:widget.obscureText, // Use local state to toggle visibility
        decoration: InputDecoration(
          suffixIcon:widget.hinttext.toLowerCase() == 'password'
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
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hinttext,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}