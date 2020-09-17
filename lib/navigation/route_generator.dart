import 'package:changescenario/pages/home.dart';
import 'package:changescenario/pages/login/login.dart';
import 'package:changescenario/pages/login/resetPassword.dart';
import 'package:changescenario/pages/login/signUp.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {

      /// Authentication
      case "/":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/signup":
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case "/resetPassword":
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());

      /// App
      case "/home":
        return MaterialPageRoute(
          builder: (_) => Home(),
        );

      default: // If Route Not Found => Error Route
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Text("Page Not Found"),
      );
    });
  }
}
