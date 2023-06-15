import 'package:flutter/material.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = 
    InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: Colors.blue,
      floatingLabelStyle: const TextStyle(color: Colors.blue),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      ),
    );
}