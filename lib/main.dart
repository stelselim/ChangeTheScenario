import 'package:changescenario/Provider/scaffoldKeyState.dart';
import 'package:changescenario/navigation/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ScaffoldKeyState>(create: (context) => ScaffoldKeyState()),
      ],
      child: MaterialApp(
        title: "Change The Scenario",
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        // initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
