import 'dart:convert';
import 'package:flutter/material.dart';

class ScenarioComment {
  final String writerUID;
  final String writerNickname;
  final DateTime postTime;
  final String comment;
  ScenarioComment({
    @required this.writerUID,
    @required this.writerNickname,
    @required this.postTime,
    @required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'writerUID': writerUID,
      'writerNickname': writerNickname,
      'postTime': postTime,
      'comment': comment,
    };
  }

  factory ScenarioComment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ScenarioComment(
      writerUID: map['writerUID'],
      writerNickname: map['writerNickname'],
      postTime: map['postTime'], // Timestamp => DateTime
      comment: map['comment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ScenarioComment.fromJson(String source) =>
      ScenarioComment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ScenarioComment(writerUID: $writerUID, writerNickname: $writerNickname, postTime: $postTime, comment: $comment)';
  }
}
