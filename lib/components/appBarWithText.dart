import 'package:changescenario/Provider/scaffoldKeyState.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget appBarWithText({
  @required num height,
  @required String title,
  @required BuildContext context,
  FontStyle italic = FontStyle.normal,
  Color textColor,
  Widget trailingWidget,
}) =>
    AppBar(
      backgroundColor: mainSecondaryColor,
      leading: IconButton(
        icon: Icon(Icons.apps),
        onPressed: () {
          Provider.of<ScaffoldKeyState>(context, listen: false)
              .scaffoldKey
              .currentState
              .openDrawer();
        },
      ),
      title: Text(
        "$title",
        style: appbarTextStyle.copyWith(
          fontStyle: italic,
          fontWeight: FontWeight.w700,
        ),
      ),
    );