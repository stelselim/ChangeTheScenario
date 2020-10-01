import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:changescenario/classes/ScenarioComment.dart';

class Scenario {
  final String title; // Scenario Title
  final String film; // Film Name
  final String scriptChanger; // Writer Nickname
  final Timestamp postTime; // Post Date
  final String script; // New Scenario
  final String writerUID; // writer Uid
  final List<String> likedUserUIDs; // Liked Users Uids
  final List<String> dislikedUserUIDs; // Disliked Users Uids
  final List<ScenarioComment> comments; // Comments
  Scenario({
    @required this.title,
    @required this.film,
    @required this.scriptChanger,
    @required this.postTime,
    @required this.script,
    @required this.writerUID,
    @required this.likedUserUIDs,
    @required this.dislikedUserUIDs,
    @required this.comments,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'film': film,
      'scriptChanger': scriptChanger,
      'postTime': postTime,
      'script': script,
      'writerUID': writerUID,
      'likedUserUIDs': likedUserUIDs,
      'dislikedUserUIDs': dislikedUserUIDs,
      'comments': comments?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Scenario.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Scenario(
      title: map['title'],
      film: map['film'],
      scriptChanger: map['scriptChanger'],
      postTime: map['postTime'],
      script: map['script'],
      writerUID: map['writerUID'],
      likedUserUIDs: List<String>.from(map['likedUserUIDs']),
      dislikedUserUIDs: List<String>.from(map['dislikedUserUIDs']),
      comments: List<ScenarioComment>.from(
          map['comments']?.map((x) => ScenarioComment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Scenario.fromJson(String source) =>
      Scenario.fromMap(json.decode(source));

  Scenario copyWith({
    String title,
    String film,
    String scriptChanger,
    Timestamp postTime,
    String script,
    String writerUID,
    List<String> likedUserUIDs,
    List<String> dislikedUserUIDs,
    List<ScenarioComment> comments,
  }) {
    return Scenario(
      title: title ?? this.title,
      film: film ?? this.film,
      scriptChanger: scriptChanger ?? this.scriptChanger,
      postTime: postTime ?? this.postTime,
      script: script ?? this.script,
      writerUID: writerUID ?? this.writerUID,
      likedUserUIDs: likedUserUIDs ?? this.likedUserUIDs,
      dislikedUserUIDs: dislikedUserUIDs ?? this.dislikedUserUIDs,
      comments: comments ?? this.comments,
    );
  }

  @override
  String toString() {
    return 'Scenario(title: $title, film: $film, scriptChanger: $scriptChanger, postTime: $postTime, script: $script, writerUID: $writerUID, likedUserUIDs: $likedUserUIDs, dislikedUserUIDs: $dislikedUserUIDs, comments: $comments)';
  }
}
