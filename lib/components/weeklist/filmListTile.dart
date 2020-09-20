import 'package:changescenario/classes/FilmsItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilmListTile extends StatelessWidget {
  FilmListTile({
    this.index,
    @required this.filmItem,
  });

  final FilmItem filmItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String filmName = filmItem.filmName;
    final String releaseYear = filmItem.releaseYear;
    final num score = filmItem.score;
    final int watched = filmItem.watched;
    final int unwatched = filmItem.unwatched;
    final num imdbRating = filmItem.imdbRating;

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
            trailing: Column(
              children: [
                Text(
                  "$score",
                  textScaleFactor: 1.35,
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidArrowAltCircleDown,
                        color: Colors.red.shade600,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "$unwatched",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        color: Colors.green.shade500,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "$watched",
                      style: TextStyle(fontSize: 14),
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
