import 'package:changescenario/Firebase/database/updateUser.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/styles/InputDecoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void showProfileBottomSheet(BuildContext context) async {
  final heightOfBottomSheet = MediaQuery.of(context).size.height * 0.5;

  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: heightOfBottomSheet,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Nickname Change
                  Consumer<UserState>(
                    builder: (context, state, _) => ListTile(
                      title: Text(state.user.nickname),
                      trailing: Icon(Icons.perm_identity),
                      onTap: () async {
                        final textKey = GlobalKey<FormState>();
                        String newnickname = "";
                        // Nickname Change Dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: heightOfBottomSheet * 0.5,
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// TextField
                                    Form(
                                      key: textKey,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        autocorrect: false,
                                        onChanged: (val) => newnickname = val,
                                        maxLength: 20,
                                        validator: (val) {
                                          if (val.length < 5)
                                            return "Least 6 Characters";
                                          if (val.length == null)
                                            return "Invalid Nickname";
                                          return null;
                                        },
                                        decoration: inputDecoration(
                                          "New Nickname",
                                          icon: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                    ButtonBar(
                                      children: [
                                        FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text("Cancel"),
                                        ),
                                        RaisedButton(
                                          onPressed: () async {
                                            print(newnickname);
                                            try {
                                              if (textKey.currentState
                                                  .validate()) {
                                                var user =
                                                    Provider.of<UserState>(
                                                            context,
                                                            listen: false)
                                                        .user;
                                                await updateUserDoc(
                                                  context,
                                                  user.copyWith(
                                                      nickname: newnickname),
                                                );
                                                Navigator.pop(context);
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          child: Text("Save!"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // Bio Change
                  Consumer<UserState>(
                    builder: (context, state, _) => ListTile(
                      subtitle: Text(
                        state.user.bio.length != 0
                            ? state.user.bio
                            : "Add a bio",
                      ),
                      trailing: Icon(Icons.info_outline),
                      onTap: () async {
                        final textKey = GlobalKey<FormState>();
                        String newBio =
                            Provider.of<UserState>(context, listen: false)
                                .user
                                .bio;
                        // Bio Change Dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                height: heightOfBottomSheet * 0.7,
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// TextField
                                    Form(
                                      key: textKey,
                                      child: TextFormField(
                                        maxLines: 3,
                                        maxLength: 150,
                                        keyboardType: TextInputType.text,
                                        autocorrect: false,
                                        initialValue: Provider.of<UserState>(
                                                context,
                                                listen: false)
                                            .user
                                            .bio,
                                        onChanged: (val) => newBio = val,
                                        validator: (val) {
                                          if (val.length < 5)
                                            return "Least 6 Characters";
                                          if (val == null) return "Invalid Bio";
                                          return null;
                                        },
                                        decoration: inputDecoration("New Bio",
                                            icon: Icon(Icons.info_outline),
                                            counter: null),
                                      ),
                                    ),
                                    ButtonBar(
                                      children: [
                                        FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text("Cancel"),
                                        ),
                                        RaisedButton(
                                          onPressed: () async {
                                            print(newBio);
                                            try {
                                              if (textKey.currentState
                                                  .validate()) {
                                                var user =
                                                    Provider.of<UserState>(
                                                            context,
                                                            listen: false)
                                                        .user;
                                                await updateUserDoc(
                                                  context,
                                                  user.copyWith(bio: newBio),
                                                );
                                                Navigator.pop(context);
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          child: Text("Save!"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              /// Sign Out - Delete My Account Button
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () async {
                      try {
                        final String email =
                            Provider.of<UserState>(context, listen: false)
                                .user
                                .email;
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email);
                        Fluttertoast.showToast(
                            msg: "Password Change Email Sent!");
                      } catch (e) {
                        Fluttertoast.showToast(msg: "Can Not Send, Try Later");
                        print(e);
                      }
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacementNamed("/");
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        );
      });
}
