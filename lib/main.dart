import 'package:changescenario/navigation/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Change The Scenario",
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      // initialRoute: "/",
      // Initialy Display Login
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
