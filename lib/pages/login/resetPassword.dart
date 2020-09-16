import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String email = "";

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade500,
            Color.fromRGBO(125, 92, 255, 1),
          ],
        ),
      ),
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
            SizedBox(
              height: height * 0.05,
            ),
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
              onTap: () {
                print(email);
                if (email != "") Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
