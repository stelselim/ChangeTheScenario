import 'package:changescenario/classes/FilmsItem.dart';
import 'package:changescenario/components/appBarText.dart';
import 'package:changescenario/components/weeklist/filmListTile.dart';
import 'package:changescenario/components/weeklist/rankNameScore.dart';
import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

/// Dummy Data
final List<Map<String, dynamic>> filmList = [
  {
    'filmName': "Batman Rises",
    'releaseYear': "2012",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
  {
    'filmName': "The Dark Knight",
    'releaseYear': "2008",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
  {
    'filmName': "Batman Begins",
    'releaseYear': "2004",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
];

class WeeklyList extends StatelessWidget {
  const WeeklyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          /// AppBar
          appBarText(
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
                  filmItem: FilmItem.fromMap(localMap),
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
