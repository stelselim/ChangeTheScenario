import 'package:changescenario/pages/discover/discover.dart';
import 'package:changescenario/pages/profile/profile.dart';
import 'package:changescenario/pages/scenario/senario.dart';
import 'package:changescenario/pages/weekList/weeklyList.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Current Body Index
  int currentIndex = 0;

  /// Body Widgets
  List<Widget> bodyStack = [
    ScenarioPage(),
    WeeklyList(),
    DiscoverPage(),
    ProfilePage(),
  ];

  /// Bottom Navigation On Tap Function For Change Body
  void bottomNavOnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    setStatusBarColorLight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: bodyStack,
      ),
      bottomNavigationBar: FloatingNavbar(
        selectedBackgroundColor: Colors.white,
        selectedItemColor: Colors.grey.shade900,
        backgroundColor: mainSecondaryColor,
        unselectedItemColor: Colors.white38,
        margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
        currentIndex: currentIndex,
        items: [
          FloatingNavbarItem(
            icon: Icons.movie_creation,
            title: 'Scenarios',
          ),
          FloatingNavbarItem(
            icon: Icons.show_chart,
            title: 'Watched',
          ),
          FloatingNavbarItem(
            icon: Icons.public,
            title: 'Discover',
          ),
          FloatingNavbarItem(
            icon: Icons.person,
            title: 'Profile',
          ),
        ],
        onTap: bottomNavOnTap,
      ),
    );
  }
}
