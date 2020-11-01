import 'dart:io';

import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/components/appDrawer.dart';
import 'package:changescenario/pages/bookmarks.dart';
import 'package:changescenario/pages/profile/profile.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:changescenario/pages/together/together.dart';
import 'package:changescenario/pages/weekList/weeklyList.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  /// Current Body Index
  int currentIndex = 0;

  // ScaffoldKey
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /// Floating Action Button Animation
  AnimationController _animationController;
  Animation _colorTween;

  /// Bottom Navigation On Tap Function For Change Body
  void bottomNavOnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    if (Platform.isIOS) {
      setStatusBarColorLight();
    }

    /// Animation Controller For Floating Action Button
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    /// Animation
    _colorTween = ColorTween(
      begin: Colors.purple,
      end: Colors.green,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Floating Action Button Will be Shown According to Current Index
  Widget floatingActionButtonSwitch(int index) {
    if (index == 0) {
      /// Add Scenario
      return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, wid) {
            return FloatingActionButton(
              backgroundColor: _colorTween.value,
              child: Icon(Icons.create),
              onPressed: () {
                Navigator.pushNamed(context, "/addScenario");
              },
            );
          },
        ),
      );
    } else if (index == 2) {
      /// Add Together Event
      return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, wid) {
            return FloatingActionButton(
              backgroundColor: _colorTween.value,
              child: Icon(Icons.event_available_rounded),
              onPressed: () {
                Navigator.pushNamed(context, "/createEvent");
              },
            );
          },
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Body Widgets
    final List<Widget> bodyStack = [
      ScenarioPage(
        scaffoldKey: scaffoldKey,
      ),
      BookmarksPage(
        scaffoldKey: scaffoldKey,
      ),
      TogetherPage(
        scaffoldKey: scaffoldKey,
      ),
      ProfilePage(
        editable: true,
        scaffoldKey: scaffoldKey,
      ),
    ];

    _animationController.repeat(reverse: true);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      // drawer: appDrawer(context),
      body: bodyStack.elementAt(currentIndex),
      floatingActionButton: floatingActionButtonSwitch(currentIndex),
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
            icon: Icons.bookmarks,
            title: 'Bookmarks',
          ),
          FloatingNavbarItem(
            icon: Icons.public,
            title: 'Together',
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
