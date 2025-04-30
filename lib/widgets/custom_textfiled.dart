import 'package:flutter/material.dart';

class CustomFromTextFiled extends StatelessWidget {
  CustomFromTextFiled({ this.onChanged, this.hintText, this.isPassword =false});
  String? hintText;
  Function(String)? onChanged;
bool? isPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
