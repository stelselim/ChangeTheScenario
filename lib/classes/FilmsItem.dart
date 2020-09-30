import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';

class FilmItem {
  final String filmName; // Film Name
  final String releaseYear; // Film Release Year
  final List<String> likedUIDs; // Liked User uids
  final List<String> dislikedUIDs; // Disliked User uids
  final bool active; // activated or not
  final num imdbRating; // Imdb rating

  FilmItem({
    @required this.filmName,
    @required this.releaseYear,
    @required this.active,
    @required this.dislikedUIDs,
    @required this.likedUIDs,
    @required this.imdbRating,
  });

  FilmItem copyWith({
    String filmName,
    String releaseYear,
    List<String> likedUIDs,
    List<String> dislikedUIDs,
    bool active,
    num imdbRating,
  }) {
    return FilmItem(
      filmName: filmName ?? this.filmName,
      releaseYear: releaseYear ?? this.releaseYear,
      likedUIDs: likedUIDs ?? this.likedUIDs,
      dislikedUIDs: dislikedUIDs ?? this.dislikedUIDs,
      active: active ?? this.active,
      imdbRating: imdbRating ?? this.imdbRating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filmName': filmName,
      'releaseYear': releaseYear,
      'likedUIDs': likedUIDs,
      'dislikedUIDs': dislikedUIDs,
      'active': active,
      'imdbRating': imdbRating,
    };
  }

  factory FilmItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FilmItem(
      filmName: map['filmName'],
      releaseYear: map['releaseYear'],
      likedUIDs: List<String>.from(map['likedUIDs']),
      dislikedUIDs: List<String>.from(map['dislikedUIDs']),
      active: map['active'],
      imdbRating: map['imdbRating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmItem.fromJson(String source) =>
      FilmItem.fromMap(json.decode(source));

  num toScore() {
    int lenDislike = dislikedUIDs.length;
    int lenLike = likedUIDs.length;
    final num score = (lenLike * 3 - lenDislike);

    return score.abs();
  }
}
