import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilmListTile extends StatelessWidget {
  FilmListTile({
    this.index,
  });

  final int index;
  final String filmName = "Batman Rises";
  final String releaseYear = "2020";
  final num score = 33;
  final int watched = 233;
  final int unwatched = 120;
  final num imdbRating = 8.9;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: Column(
        children: [
          // index == 0 ? Divider() : Container(),
          ListTile(
            title: Text("$filmName - $releaseYear"),
            // subtitle: Text("IMDB: $imdbRating -  Year: $releaseYear"),
            leading: Text(
              "${index + 1}",
              textScaleFactor: 1.15,
            ),
            trailing: Text(
              "$score",
              textScaleFactor: 1.35,
            ),
            subtitle: Row(
              children: [
                Row(
                  children: [
                    Text(
                      "$unwatched",
                      style: TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidArrowAltCircleDown,
                        color: Colors.red.shade600,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "$watched",
                      style: TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        color: Colors.green.shade500,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
