import 'dart:convert';

import 'package:flutter/material.dart';

class FilmItem {
  final String filmName;
  final String releaseYear;
  final num score;
  final int watched;
  final int unwatched;
  final num imdbRating;

  FilmItem({
    @required this.filmName,
    @required this.releaseYear,
    @required this.score,
    @required this.watched,
    @required this.unwatched,
    @required this.imdbRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'filmName': filmName,
      'releaseYear': releaseYear,
      'score': score,
      'watched': watched,
      'unwatched': unwatched,
      'imdbRating': imdbRating,
    };
  }

  factory FilmItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FilmItem(
      filmName: map['filmName'],
      releaseYear: map['releaseYear'],
      score: map['score'],
      watched: map['watched'],
      unwatched: map['unwatched'],
      imdbRating: map['imdbRating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmItem.fromJson(String source) =>
      FilmItem.fromMap(json.decode(source));
}
