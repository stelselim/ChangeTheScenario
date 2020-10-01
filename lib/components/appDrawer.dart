import 'package:changescenario/styles/color/backgroundDecoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget appDrawer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;

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
          /// Header & App Icon
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
                  // App Icon
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
                onTap: () => Navigator.pushNamed(context, "/bookmarks"),
                title: Text(
                  "Bookmarks",
                  style: drawerCategoryTextStyle,
                ),
                trailing: Icon(
                  FontAwesomeIcons.solidBookmark,
                  color: drawerCategoryTextStyle.color,
                ),
              ),
            ),
          ),

          // SizedBox(
          //   height: 5,
          // ),

          // // Bize Sorun
          // Container(
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          //     child: ListTile(
          //       onTap: () {
          //         Navigator.pushNamed(context, "BizeSorun");
          //         scaffoldKey.currentState.openEndDrawer();
          //       },
          //       title: Text(
          //         "Contact",
          //         style: drawerCategoryTextStyle,
          //       ),
          //       trailing: Icon(
          //         FontAwesomeIcons.question,
          //         color: drawerCategoryTextStyle.color,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
