import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String massage, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        
        content: Text(
          massage,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }