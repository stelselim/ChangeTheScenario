import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:changescenario/classes/ScenarioComment.dart';

class Scenario {
  final String title;
  final String film;
  final String scriptChanger;
  final DateTime postTime;
  final int like;
  final int dislike;
  final String script;
  final String writerUID;
  final String docid;
  final List<String> likedUserUIDs;
  final List<String> dislikedUserUIDs;
  final List<ScenarioComment> comments;
  Scenario({
    @required this.title,
    @required this.film,
    @required this.scriptChanger,
    @required this.postTime,
    @required this.like,
    @required this.dislike,
    @required this.script,
    @required this.writerUID,
    @required this.docid,
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
      'like': like,
      'dislike': dislike,
      'script': script,
      'writerUID': writerUID,
      'docid': docid,
      'likedUserUIDs': likedUserUIDs,
      'dislikedUserUIDs': dislikedUserUIDs,
      'comments': comments,
    };
  }

  factory Scenario.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Scenario(
      title: map['title'],
      film: map['film'],
      scriptChanger: map['scriptChanger'],
      postTime: map['postTime'], // from TimeStamp => DateTime
      like: map['like'],
      dislike: map['dislike'],
      script: map['script'],
      writerUID: map['writerUID'],
      docid: map['docid'],
      likedUserUIDs: List<String>.from(map['likedUserUIDs']),
      dislikedUserUIDs: List<String>.from(map['dislikedUserUIDs']),
      comments: List<ScenarioComment>.from(map['comments']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Scenario.fromJson(String source) =>
      Scenario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Scenario(title: $title, film: $film, scriptChanger: $scriptChanger, postTime: $postTime, like: $like, dislike: $dislike, script: $script, writerUID: $writerUID, docid: $docid, likedUserUIDs: $likedUserUIDs, dislikedUserUIDs: $dislikedUserUIDs, comments: $comments)';
  }
}
