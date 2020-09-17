import 'package:changescenario/components/weeklist/filmListTile.dart';
import 'package:flutter/material.dart';

class WeeklyList extends StatelessWidget {
  const WeeklyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Weekly List",
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ListView.builder(
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
        ],
      ),
    );
  }
}
