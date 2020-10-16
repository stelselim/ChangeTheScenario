import 'package:changescenario/pages/bookmarks.dart';
import 'package:changescenario/pages/home.dart';
import 'package:changescenario/pages/login/login.dart';
import 'package:changescenario/pages/login/resetPassword.dart';
import 'package:changescenario/pages/login/signUp.dart';
import 'package:changescenario/pages/scenario/createScenarioScreen.dart';
import 'package:changescenario/pages/together/createEvent.dart';
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

      case "/addScenario":
        return MaterialPageRoute(builder: (_) => ScenarioAddPage());
      case "/createEvent":
        return MaterialPageRoute(builder: (_) => CreateEventPage());

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
        body: Center(
          child: Text("Page Not Found"),
        ),
      );
    });
  }
}
