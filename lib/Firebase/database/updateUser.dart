import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future updateUserDoc(BuildContext context, AppUser updatedUser) async {
  final user = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection(userColletion)
      .doc(user.uid)
      .update(updatedUser.toMap());

  // Also update to Provider: Customer
  Provider.of<UserState>(context, listen: false).setUser(updatedUser);
}
