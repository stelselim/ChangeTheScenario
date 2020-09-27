import 'package:changescenario/classes/FilmsItem.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/weeklist/filmListTile.dart';
import 'package:changescenario/components/weeklist/rankNameScore.dart';
import 'package:changescenario/styles/textStyles/textStyles.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
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
  {
    'filmName': "Batman Rises",
    'releaseYear': "2012",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
  {
    'filmName': "Batman Rises",
    'releaseYear': "2012",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
  {
    'filmName': "Batman Rises",
    'releaseYear': "2012",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
  {
    'filmName': "Batman Rises",
    'releaseYear': "2012",
    'score': 33,
    'watched': 122,
    'unwatched': 67,
    'imdbRating': 8.4,
  },
];

class WeeklyList extends StatefulWidget {
  const WeeklyList({Key key}) : super(key: key);

  @override
  _WeeklyListState createState() => _WeeklyListState();
}

class _WeeklyListState extends State<WeeklyList> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColorLight();

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
