import 'dart:convert';
import 'package:flutter/material.dart';

class Follower {
  final String uid; // Follower uid
  final String nickname; // Follower nickname
  Follower({
    @required this.uid,
    @required this.nickname,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
    };
  }

  factory Follower.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Follower(
      uid: map['uid'],
      nickname: map['nickname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Follower.fromJson(String source) =>
      Follower.fromMap(json.decode(source));

  Follower copyWith({
    String uid,
    String nickname,
  }) {
    return Follower(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  String toString() => 'Follower(uid: $uid, nickname: $nickname)';
}
