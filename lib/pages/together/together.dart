import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:flutter/material.dart';

class TogetherPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TogetherPage({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWithText(
          scaffoldKey: scaffoldKey,
          context: context,
          height: MediaQuery.of(context).size.height,
          title: "Watch Together",
        ),
        Container(
          child: Center(
            child: Text("Together Watch Show"),
          ),
        ),
      ],
    );
  }
}
