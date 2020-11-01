import 'dart:io';

import 'package:changescenario/classes/FilmsItem.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/weeklist/filmListTile.dart';
import 'package:changescenario/components/weeklist/rankNameScore.dart';
import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:flutter/material.dart';

/// Dummy Data
final List<FilmItem> filmList = [
  FilmItem(
    active: true,
    dislikedUIDs: [],
    filmName: "Batman Begins",
    imdbRating: 8.4,
    likedUIDs: [],
    releaseYear: "2008",
  )
];

class WeeklyList extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WeeklyList({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  _WeeklyListState createState() => _WeeklyListState();
}

class _WeeklyListState extends State<WeeklyList> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      setStatusBarColorLight();
    }

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 500));
        print("Refreshing History");
        setState(() {});
      },
      child: Column(
        children: [
          /// AppBar
          appBarWithText(
            scaffoldKey: widget.scaffoldKey,
            context: context,
            height: height,
            title: "Week's Film Board",
            italic: FontStyle.italic,
            textColor: Colors.green.shade800,
          ),

          /// Rank - Film Name - Score Info Header
          RankNameScore(),

          /// Custom Divider
          Container(
            height: 0.35,
            color: Colors.blueGrey.shade900,
          ),

          /// Film Lists
          /*
           Before Passing Maps, Should make them ordered according to their scores;
           */
          Expanded(
            child: ListView.builder(
              itemCount: filmList.length,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final localMap = filmList.elementAt(index);

                return FilmListTile(
                  filmItem: FilmItem.fromMap(localMap.toMap()),
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
