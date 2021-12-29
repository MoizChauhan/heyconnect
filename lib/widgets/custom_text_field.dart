import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool issecured;
  final TextInputType? keyboardType;
  final TextInputAction? action;
  final TextEditingController? controller;
  final onDone;
  final IconData? icon;
  final Color? iconcolor;

  CustomTextField(
      {required this.hint, required this.issecured, this.keyboardType, this.action, this.controller, this.onDone, this.icon, this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 48,
      child: TextField(
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
        textInputAction: action,
        controller: controller,
        onSubmitted: onDone,
        obscureText: issecured,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 1),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 18, right: 16),
              child: Icon(
                icon,
                color: iconcolor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            filled: false,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500, height: 0, fontSize: 15)),
      ),
    );
  }
}
