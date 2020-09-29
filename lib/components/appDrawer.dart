import 'package:changescenario/Provider/scaffoldKeyState.dart';
import 'package:changescenario/styles/color/backgroundDecoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

Widget appDrawer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final scaffoldKey =
      Provider.of<ScaffoldKeyState>(context, listen: false).scaffoldKey;

  var headerTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  var drawerCategoryTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white.withOpacity(0.85),
    fontWeight: FontWeight.w500,
  );
  return Drawer(
    semanticLabel: "YanMenü",
    elevation: 12,
    child: Container(
      decoration: drawerBackgroundDecoration,
      child: ListView(
        children: <Widget>[
          /// Header
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    "Change Scenarios",
                    style: headerTextStyle,
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purple.shade600,
                    child: Text(
                      "CS",
                      style: headerTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Space
          SizedBox(
            height: height * 0.15,
          ),

          // HomePage
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 9, 0),
              child: ListTile(
                onTap: () => Navigator.pop(context),
                title: Text(
                  "Anasayfa",
                  style: drawerCategoryTextStyle,
                ),
                trailing: Icon(
                  FontAwesomeIcons.home,
                  color: drawerCategoryTextStyle.color,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),

          // Rehber
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "Rehber");
                  scaffoldKey.currentState.openEndDrawer();
                },
                title: Text(
                  "Beslenme Rehberi",
                  style: drawerCategoryTextStyle,
                ),
                trailing: Icon(
                  Icons.library_books,
                  color: drawerCategoryTextStyle.color,
                ),
              ),
            ),
          ),

          SizedBox(height: 5),
          // Calculators
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 7, 0),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "CalculatorMain");
                  scaffoldKey.currentState.openEndDrawer();
                },
                title: Text(
                  "Hesaplayıcılar",
                  style: drawerCategoryTextStyle,
                ),
                trailing: Icon(
                  FontAwesomeIcons.calculator,
                  color: drawerCategoryTextStyle.color,
                ),
              ),
            ),
          ),

          SizedBox(height: 5),

          // Bize Sorun
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "BizeSorun");
                  scaffoldKey.currentState.openEndDrawer();
                },
                title: Text(
                  "Soru Cevap",
                  style: drawerCategoryTextStyle,
                ),
                trailing: Icon(
                  FontAwesomeIcons.question,
                  color: drawerCategoryTextStyle.color,
                ),
              ),
            ),
          ),

          SizedBox(height: 5),
          // About
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 7, 0),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "AboutUs");
                  scaffoldKey.currentState.openEndDrawer();
                },
                title: Text(
                  "Hakkımızda",
                  style: drawerCategoryTextStyle,
                ),
                trailing: Icon(
                  FontAwesomeIcons.infoCircle,
                  color: drawerCategoryTextStyle.color,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
