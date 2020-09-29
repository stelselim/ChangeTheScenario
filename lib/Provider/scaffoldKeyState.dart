import 'package:flutter/material.dart';

class ScaffoldKeyState {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState.openDrawer();
  }

  void hideDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }
}
