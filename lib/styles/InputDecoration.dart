import 'package:flutter/material.dart';

InputDecoration inputDecoration(String labelText,
    {Widget icon, String counter = ""}) {
  return InputDecoration(
    counterText: counter,
    fillColor: Colors.white,
    filled: true,
    suffixIcon: icon,
    labelStyle: TextStyle(color: Colors.grey),
    labelText: labelText,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    ),
  );
}
