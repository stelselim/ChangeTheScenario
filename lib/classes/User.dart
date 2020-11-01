import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:changescenario/classes/Follower.dart';

class AppUser {
  final String nickname;
  final String uid;
  final String email;
  final String bio;
  final Timestamp registerDate;
  final List<String> blockedUsers;
  final List<String> likedFilms;
  final List<String> dislikedFilms;
  final List<Follower> followers;
  final List<Follower> following;
  AppUser({
    @required this.followers,
    @required this.following,
    @required this.nickname,
    @required this.uid,
    @required this.bio,
    @required this.blockedUsers,
    @required this.email,
    @required this.registerDate,
    @required this.likedFilms,
    @required this.dislikedFilms,
  });

  AppUser copyWith({
    String nickname,
    String uid,
    String email,
    String bio,
    Timestamp registerDate,
    List<String> likedFilms,
    List<String> blockedUsers,
    List<String> dislikedFilms,
    List<Follower> followers,
    List<Follower> following,
  }) {
    return AppUser(
      nickname: nickname ?? this.nickname,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      blockedUsers: blockedUsers ?? this.blockedUsers,
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
      'blockedUsers': blockedUsers,
      'registerDate': registerDate,
      'likedFilms': likedFilms,
      'dislikedFilms': dislikedFilms,
      'followers': followers?.map((x) => x?.toMap())?.toList(),
      'following': following?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppUser(
      nickname: map['nickname'],
      uid: map['uid'],
      email: map['email'],
      bio: map['bio'],
      blockedUsers: map['blockedUsers'],
      registerDate: map['registerDate'],
      likedFilms: List<String>.from(map['likedFilms']),
      dislikedFilms: List<String>.from(map['dislikedFilms']),
      followers: List<Follower>.from(
          map['followers']?.map((x) => Follower.fromMap(x))),
      following: List<Follower>.from(
          map['following']?.map((x) => Follower.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(nickname: $nickname, uid: $uid, email: $email, blockedUsers: $blockedUsers, bio: $bio, registerDate: $registerDate, likedFilms: $likedFilms, dislikedFilms: $dislikedFilms, followers: $followers, following: $following)';
  }
}
