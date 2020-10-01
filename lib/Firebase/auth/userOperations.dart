import 'package:firebase_auth/firebase_auth.dart';

Future<User> signInWithEmail(String email, String password) async {
  final user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  return user.user;
}

Future sendPasswordReset(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

Future<User> registerUserWithEmail(String email, String password) async {
  final user = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  return user.user;
}
