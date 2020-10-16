import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilmEvent {
  final String filmName; // Film Name
  final Color label; // Label by User
  final Timestamp toWatchTime; // To Watch Time
  final List<String> toWatchPeople; // Users uids to Watch
  final String creatorNickname; // Event Creator Nickname
  final String creatorUid; // Event Creator Uid
  FilmEvent({
    @required this.filmName,
    @required this.label,
    @required this.toWatchTime,
    @required this.toWatchPeople,
    @required this.creatorNickname,
    @required this.creatorUid,
  });

  FilmEvent copyWith({
    String filmName,
    Color label,
    Timestamp toWatchTime,
    List<String> toWatchPeople,
    String creatorNickname,
    String creatorUid,
  }) {
    return FilmEvent(
      filmName: filmName ?? this.filmName,
      label: label ?? this.label,
      toWatchTime: toWatchTime ?? this.toWatchTime,
      toWatchPeople: toWatchPeople ?? this.toWatchPeople,
      creatorNickname: creatorNickname ?? this.creatorNickname,
      creatorUid: creatorUid ?? this.creatorUid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filmName': filmName,
      'label': label?.value,
      'toWatchTime': toWatchTime,
      'toWatchPeople': toWatchPeople,
      'creatorNickname': creatorNickname,
      'creatorUid': creatorUid,
    };
  }

  factory FilmEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FilmEvent(
      filmName: map['filmName'],
      label: Color(map['label']),
      toWatchTime: map['toWatchTime'],
      toWatchPeople: List<String>.from(map['toWatchPeople']),
      creatorNickname: map['creatorNickname'],
      creatorUid: map['creatorUid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmEvent.fromJson(String source) =>
      FilmEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FilmEvent(filmName: $filmName, label: $label, toWatchTime: $toWatchTime, toWatchPeople: $toWatchPeople, creatorNickname: $creatorNickname, creatorUid: $creatorUid)';
  }
}
