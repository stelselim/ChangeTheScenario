import 'package:changescenario/Firebase/database/updateUser.dart';
import 'package:changescenario/classes/User.dart';
import 'package:flutter/material.dart';

Future blockUser({
  @required BuildContext context,
  @required AppUser currentUser,
  @required String toBlockUid,
}) async {
  var toUpdateUser = currentUser.copyWith();
  toUpdateUser.blockedUsers.add(toBlockUid);
  await updateUserDoc(context, toUpdateUser);
}
