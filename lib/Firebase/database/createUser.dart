import 'package:changescenario/Firebase/auth/userOperations.dart';
import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/classes/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

///  Steps:
/// 1- Register User with Email & Password
/// 2- Create User Doc
Future registerAndCreateUserDoc({
  @required AppUser newUser,
  @required String email,
  @required String password,
}) async {
  /// Create User & Get User
  final user = await registerUserWithEmail(email, password);

  /// Update User Class with his Uid
  final userDoc = newUser.copyWith(uid: user.uid);

  // Create User Doc, includes his uid
  await FirebaseFirestore.instance
      .collection(userColletion)
      .doc(user.uid)
      .set(userDoc.toMap());
  print("Kayıt Başarılı");
}
