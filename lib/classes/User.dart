import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:changescenario/classes/Follower.dart';

class User {
  final String nickname;
  final String uid;
  final String email;
  final String bio;
  final DateTime registerDate;
  final List<String> likedFilms;
  final List<String> dislikedFilms;
  final List<Follower> followers;
  final List<Follower> following;
  User({
    @required this.followers,
    @required this.following,
    @required this.nickname,
    @required this.uid,
    @required this.bio,
    @required this.email,
    @required this.registerDate,
    @required this.likedFilms,
    @required this.dislikedFilms,
  });

  User copyWith({
    String nickname,
    String uid,
    String email,
    String bio,
    DateTime registerDate,
    List<String> likedFilms,
    List<String> dislikedFilms,
    List<Follower> followers,
    List<Follower> following,
  }) {
    return User(
      nickname: nickname ?? this.nickname,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      registerDate: registerDate ?? this.registerDate,
      likedFilms: likedFilms ?? this.likedFilms,
      dislikedFilms: dislikedFilms ?? this.dislikedFilms,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'uid': uid,
      'email': email,
      'bio': bio,
      'registerDate': registerDate?.millisecondsSinceEpoch,
      'likedFilms': likedFilms,
      'dislikedFilms': dislikedFilms,
      'followers': followers?.map((x) => x?.toMap())?.toList(),
      'following': following?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      nickname: map['nickname'],
      uid: map['uid'],
      email: map['email'],
      bio: map['bio'],
      registerDate: DateTime.fromMillisecondsSinceEpoch(map['registerDate']),
      likedFilms: List<String>.from(map['likedFilms']),
      dislikedFilms: List<String>.from(map['dislikedFilms']),
      followers: List<Follower>.from(
          map['followers']?.map((x) => Follower.fromMap(x))),
      following: List<Follower>.from(
          map['following']?.map((x) => Follower.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(nickname: $nickname, uid: $uid, email: $email, bio: $bio, registerDate: $registerDate, likedFilms: $likedFilms, dislikedFilms: $dislikedFilms, followers: $followers, following: $following)';
  }
}
