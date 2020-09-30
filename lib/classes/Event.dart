import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilmEvent {
  final String filmName; // Film Name
  final Color label; // Label by User
  final Timestamp toWatchTime; // To Watch Time
  final List<String> toWatchPeople; // Users uids to Watch
  final String creator; // Event Creator Uid
  FilmEvent({
    this.filmName,
    this.label,
    this.toWatchTime,
    this.toWatchPeople,
    this.creator,
  });

  Map<String, dynamic> toMap() {
    return {
      'filmName': filmName,
      'label': label?.value,
      'toWatchTime': toWatchTime,
      'toWatchPeople': toWatchPeople,
      'creator': creator,
    };
  }

  factory FilmEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FilmEvent(
      filmName: map['filmName'],
      label: Color(map['label']),
      toWatchTime: map['toWatchTime'],
      toWatchPeople: map['toWatchPeople'],
      creator: map['creator'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmEvent.fromJson(String source) =>
      FilmEvent.fromMap(json.decode(source));

  FilmEvent copyWith({
    String filmName,
    Color label,
    Timestamp toWatchTime,
    List<String> toWatchPeople,
    String creator,
  }) {
    return FilmEvent(
      filmName: filmName ?? this.filmName,
      label: label ?? this.label,
      toWatchTime: toWatchTime ?? this.toWatchTime,
      toWatchPeople: toWatchPeople ?? this.toWatchPeople,
      creator: creator ?? this.creator,
    );
  }

  @override
  String toString() {
    return 'FilmEvent(filmName: $filmName, label: $label, toWatchTime: $toWatchTime, toWatchPeople: $toWatchPeople, creator: $creator)';
  }
}
