import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

Widget appBarWithText({
  @required num height,
  @required String title,
  FontStyle italic = FontStyle.normal,
  Color textColor,
  Widget trailingWidget,
}) =>
    AppBar(
      backgroundColor: mainSecondaryColor,
      leading: Container(),
      title: Text(
        "$title",
        style: appbarTextStyle.copyWith(
          fontStyle: italic,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
