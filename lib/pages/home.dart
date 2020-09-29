import 'package:changescenario/Provider/scaffoldKeyState.dart';
import 'package:changescenario/components/appDrawer.dart';
import 'package:changescenario/pages/profile/profile.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:changescenario/pages/together/together.dart';
import 'package:changescenario/pages/weekList/weeklyList.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  /// Current Body Index
  int currentIndex = 0;

  // ScaffoldKey
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /// Body Widgets
  final List<Widget> bodyStack = [
    ScenarioPage(),
    WeeklyList(),
    TogetherPage(),
    ProfilePage(),
  ];

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
    setStatusBarColorLight();

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
    super.dispose();
    _animationController.dispose();
  }

  /// Floating Action Button Will be Shown According to Current Index
  Widget floatingActionButtonSwitch(int index) {
    if (index == 0) {
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
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    _animationController.repeat(reverse: true);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: Provider.of<ScaffoldKeyState>(context, listen: false).scaffoldKey,
      backgroundColor: Colors.white,
      drawer: appDrawer(context),
      body: IndexedStack(
        index: currentIndex,
        children: bodyStack,
      ),
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
            icon: Icons.show_chart,
            title: 'Watched',
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
