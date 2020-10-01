import 'package:changescenario/Firebase/database/createScenario.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/styles/InputDecoration.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

/// This is the screen that scenariouses created by users
class ScenarioAddPage extends StatelessWidget {
  ScenarioAddPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Form Key
    final formKey = GlobalKey<FormState>();

    // New Title
    final titleController = TextEditingController();
    // New Scenario
    final scenarioController = TextEditingController();
    // Film Name
    final filmNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainSecondaryColor,
        title: Text("Share Your Scenario!"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),

              /// Film Title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: TextFormField(
                  controller: filmNameController,
                  maxLength: 45,
                  keyboardType: TextInputType.text,
                  maxLengthEnforced: true,
                  decoration: inputDecoration(
                    "Film Name",
                    icon: Icon(Icons.local_movies),
                  ),
                  validator: (val) {
                    if (val == null || val.length == 0) {
                      return "Enter A Film Name";
                    } else
                      return null;
                  },
                ),
              ),

              /// Film Title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: TextFormField(
                  decoration: inputDecoration(
                    "Scenario Title",
                    icon: Icon(Icons.movie),
                  ),
                  keyboardType: TextInputType.text,
                  controller: titleController,
                  maxLength: 45,
                  maxLengthEnforced: true,
                  validator: (val) {
                    if (val == null || val.length == 0) {
                      return "Enter A Scenario Title";
                    } else
                      return null;
                  },
                ),
              ),

              /// Film Script
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: TextFormField(
                  maxLines: 12,
                  keyboardType: TextInputType.text,
                  controller: scenarioController,
                  decoration: inputDecoration(
                    "New Script",
                  ),
                  validator: (val) {
                    if (val == null || val.length < 10) {
                      return "At Least 10 Characters";
                    } else
                      return null;
                  },
                ),
              ),

              /// Share
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text(
                    "Share Now",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.5,
                  ),
                  color: mainSecondaryColor.withOpacity(1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.all(15),
                  onPressed: () async {
                    final currentUser =
                        Provider.of<UserState>(context, listen: false).user;
                    try {
                      if (formKey.currentState.validate()) {
                        final scenario = Scenario(
                          writerUID: currentUser.uid,
                          scriptChanger: currentUser.nickname,
                          dislikedUserUIDs: [],
                          comments: [],
                          postTime: Timestamp.now(),
                          likedUserUIDs: [],
                          film: filmNameController.text, // Film Name
                          script: scenarioController.text, // New Script
                          title: titleController.text, // New Title
                        );

                        /// Create New Scenario
                        await createScenario(
                          context,
                          scenario,
                        );
                        Fluttertoast.showToast(msg: "Shared");
                        Navigator.of(context).pushReplacementNamed("/home");
                      }
                    } catch (e) {
                      Fluttertoast.showToast(msg: "Try Again");
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
