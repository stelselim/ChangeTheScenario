import 'package:changescenario/navigation/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/UserState.dart';
import 'notification/notifications_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase initiliaze
  try {
    if (!kIsWeb) {
      WidgetsFlutterBinding.ensureInitialized();
      initNotification(); // Initialize Notifications
    }
  } catch (e) {
    print(e);
  }
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserState>(
          create: (context) => UserState(),
        ),
      ],
      child: MaterialApp(
        title: "Change The Scenario",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
