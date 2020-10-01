import 'package:flutter/material.dart';

InputDecoration fieldInputDecoration(Widget icon, String labelText) {
  return InputDecoration(
      counterText: "",
      fillColor: Colors.white,
      filled: true,
      suffixIcon: icon,
      labelStyle: TextStyle(color: Colors.grey),
      labelText: labelText,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey[300])),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey[300])),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey[300])));
}
