import 'package:changescenario/components/appBarText.dart';
import 'package:changescenario/components/weeklist/filmListTile.dart';
import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class WeeklyList extends StatelessWidget {
  const WeeklyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          appBarText(
            height: height,
            title: "Watched Or Not",
            italic: FontStyle.italic,
            textColor: Colors.green.shade800,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FilmListTile(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
