import 'package:changescenario/Firebase/auth/userOperations.dart';
import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/User.dart';
import 'package:changescenario/styles/color/backgroundDecoration.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///AutoLogin
  bool autoLogin = false;

  String email = ""; // Login Email
  String password = ""; // Login Password

  bool isCurrentUserNull() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return true;
    }
    return false;
  }

  Future<void> loginFunction(BuildContext context) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) return;
    final userDoc = await FirebaseFirestore.instance
        .collection(userColletion)
        .doc(currentUser.uid)
        .get();
    Provider.of<UserState>(context, listen: false)
        .setUser(AppUser.fromMap(userDoc.data()));
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  void initState() {
    autoLogin = isCurrentUserNull();
    if (autoLogin) loginFunction(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final topSpaceRatio = 0.11;
    final headerFormSpaceRatio = 0.08;
    final formButtonSpaceRatio = 0.035;

    /// Light Status Color
    setStatusBarColorDark();

    if (autoLogin) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: height * 1.2,
          width: width * 1.2,
          decoration: backgroundDecoration,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                  ),
                  // Email & Password
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Change The Scenario",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(text: "\n"),
                        TextSpan(
                          text: "With Yours",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: height * 1,
        decoration: backgroundDecoration,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * topSpaceRatio,
                ),
                // Email & Password
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Change The Scenario",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: "With Yours",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: height * headerFormSpaceRatio,
                ),

                /// Email
                Container(
                  padding: const EdgeInsets.only(
                      left: 15, bottom: 2, right: 2, top: 2),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                    obscureText: false,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onChanged: (val) => email = val,
                    onSaved: (val) => email = val,
                  ),
                ),

                /// Password
                Container(
                  padding: const EdgeInsets.only(
                      left: 15, bottom: 2, right: 2, top: 2),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) => password = val,
                    onSaved: (val) => password = val,
                  ),
                ),
                SizedBox(
                  height: height * formButtonSpaceRatio,
                ),

                /// Login
                GestureDetector(
                  child: Container(
                    width: width * 0.45,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.red.shade500,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.movie,
                          color: Colors.black.withOpacity(0.8),
                          size: 28,
                        )
                      ],
                    ),
                  ),
                  onTap: () async {
                    if (email != "" && email.contains('@') && password != "") {
                      try {
                        await signInWithEmail(email, password);
                        await loginFunction(context);
                        Fluttertoast.showToast(msg: "Logged In!");
                      } catch (e) {}
                    } else {
                      Fluttertoast.showToast(
                          msg: "Check Your Email or Password");
                    }
                  },
                ),

                /// Signup
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FlatButton(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Don't Have Account?  ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Sign Up Now!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                    ),
                    onPressed: () => Navigator.pushNamed(context, "/signup"),
                  ),
                ),

                /// Reset Password
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: FlatButton(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, "/resetPassword"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
