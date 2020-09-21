import 'dart:convert';
import 'package:flutter/material.dart';

class User {
  final String nickname;
  final String uid;
  final String email;
  final DateTime registerDate;
  final List<String> likedFilms = []; // Thinking
  final List<String> dislikedFilms = []; // Thinking
  User({
    @required this.nickname,
    @required this.uid,
    @required this.email,
    @required this.registerDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'uid': uid,
      'email': email,
      'registerDate': registerDate,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      nickname: map['nickname'],
      uid: map['uid'],
      email: map['email'],
      registerDate: map['registerDate'], // From Timestamp => DateTime
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(nickname: $nickname, uid: $uid, email: $email, registerDate: $registerDate)';
  }
}
