import 'package:changescenario/classes/User.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  User user;

  setUser(User updatedUser) {
    if (user == updatedUser) return;

    user = updatedUser;
    notifyListeners();
  }
}
