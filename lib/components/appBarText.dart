import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

Widget appBarText({
  @required num height,
  @required String title,
  FontStyle italic = FontStyle.normal,
  @required Color textColor,
}) =>
    Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 12, bottom: 18.0),
      child: Text(
        "$title",
        style: appbarTextStyle.copyWith(
          fontStyle: italic,
          color: textColor,
        ),
      ),
    );
