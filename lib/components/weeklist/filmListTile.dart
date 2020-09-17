import 'package:flutter/material.dart';

class FilmListTile extends StatelessWidget {
  FilmListTile({this.index});

  final int index;
  final filmName = "Batman Rises";
  final releaseYear = "2020";
  final score = 33;
  final imdbRating = 8.9;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      alignment: Alignment.center,
      child: Column(
        children: [
          ListTile(
            title: Text("$filmName"),
            subtitle: Text("IMDB: $imdbRating -  Year: $releaseYear"),
            leading: Text(
              "${index + 1}",
              textScaleFactor: 1.15,
            ),
            trailing: Text(
              "$score",
              textScaleFactor: 1.35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(" Wathced"),
              Text("Unwathced"),
            ],
          )
        ],
      ),
    );
  }
}
