import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

Widget appBarText({
  @required num height,
  @required String title,
  @required FontStyle italic,
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

class AppBarWithText extends StatelessWidget {
  final height;
  final italic;
  final textColor;
  final title;

  AppBarWithText(
    this.height,
    this.italic,
    this.textColor,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 12, top: height * 0.05, bottom: 18.0),
      child: Text(
        "Watched Or Not",
        style: appbarTextStyle.copyWith(
          fontStyle: italic,
        ),
      ),
    );
  }
}
