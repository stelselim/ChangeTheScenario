import 'package:changescenario/styles/color/backgroundDecoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String email = "";

    return Container(
      decoration: backgroundDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Reset Password",
            textScaleFactor: 1.25,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Space
            SizedBox(
              height: height * 0.05,
            ),
            // Email Form
            Container(
              padding:
                  const EdgeInsets.only(left: 15, bottom: 2, right: 2, top: 2),
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
            // Send Button
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: width * 0.4,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      "Send Email!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                print(email);
                if (email != "" && email.contains('@')) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email);
                    Navigator.pushReplacementNamed(context, "/");
                    Fluttertoast.showToast(msg: "Password Reset Email Sent");
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: "Not Found An Account with This Email");
                    print(e);
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "Please Enter Valid Email",
                      gravity: ToastGravity.CENTER);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
