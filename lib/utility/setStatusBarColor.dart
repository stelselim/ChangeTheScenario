import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Set Status Bar Color Light
/// iOS Top Fonts Color => Black
setStatusBarColorLight() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light, // Light Color Choosen
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
}

/// Set Status Bar Color Dark
/// iOS Top Fonts Color => White
setStatusBarColorDark() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark, // Light Color Choosen
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
}
