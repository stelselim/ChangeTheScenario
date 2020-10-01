import 'package:changescenario/classes/User.dart';
import 'package:flutter/material.dart';

class UserState with ChangeNotifier {
  AppUser user;

  setUser(AppUser updatedUser) {
    if (user == updatedUser) return;

    user = updatedUser;
    notifyListeners();
  }
}
