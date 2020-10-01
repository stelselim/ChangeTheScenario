import 'package:changescenario/constant/termsOfService.dart';
import 'package:changescenario/styles/color/backgroundDecoration.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "";
  String nickname = "";
  String password = "";
  bool checkBoxVal = false;
  final registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: backgroundDecoration,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Join US!",
            textScaleFactor: 1.25,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Form(
          key: registerKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Space
              SizedBox(
                height: height * 0.05,
              ),
              // Nickname
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
                    errorStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: "Nickname or Name",
                    border: InputBorder.none,
                  ),
                  obscureText: false,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (val) => nickname = val,
                  onSaved: (val) => nickname = val,
                  validator: (val) {
                    if (val.length <= 3) {
                      return "Should be more than 3 characters";
                    }
                    return null;
                  },
                ),
              ),
              // Email
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
                    errorStyle: TextStyle(
                      color: Colors.white,
                    ),
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
                  validator: (val) {
                    if (val.length <= 5 || !val.contains('@')) {
                      return "Invalid Email";
                    }
                    return null;
                  },
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
                    errorStyle: TextStyle(
                      color: Colors.white,
                    ),
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
                  validator: (val) {
                    if (val.length <= 5) {
                      return "Must be more than 5 characters";
                    }
                    return null;
                  },
                ),
              ),

              /// Agree To Service
              CheckboxListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                activeColor: Colors.white,
                checkColor: Colors.black,
                value: checkBoxVal,
                onChanged: (bool value) {
                  if (value == true) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          // Terms Of Service Dialog
                          return Dialog(
                            child: Container(
                              height: height * 0.55,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Terms Of Service",
                                              textScaleFactor: 1.5,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text("$termsOfService"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ButtonBar(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FlatButton(
                                            child: Text(
                                              "Agreed",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  setState(() {
                    checkBoxVal = value;
                  });
                },
                title: Text(
                  "Agree to The Terms Of Service",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),

              /// Register
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 60),
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
                        "Sign UP!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // Must be true
                  if (!checkBoxVal) {
                    Fluttertoast.showToast(
                        msg: "Agree To The Terms Of Service");
                    return;
                  }
                  if (registerKey.currentState.validate()) {
                    registerKey.currentState.save();
                    Fluttertoast.showToast(msg: "Welcome To The Community!");
                    print("Succesfull");
                    print("Nick: " + nickname);
                    print("Email: " + email);
                    print("Pass: " + password);
                    Navigator.of(context).pushReplacementNamed("/");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
