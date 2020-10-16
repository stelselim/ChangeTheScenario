import 'package:changescenario/Firebase/database/createFilmEvent.dart';
import 'package:changescenario/Firebase/database/createScenario.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Event.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/styles/InputDecoration.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// This is the screen that scenariouses created by users
class CreateEventPage extends StatefulWidget {
  CreateEventPage({Key key}) : super(key: key);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  DateTime dateTime;

  /// Form Key
  final formKey = GlobalKey<FormState>();

  // New Title
  final titleController = TextEditingController();
  // New Scenario
  final scenarioController = TextEditingController();
  // Film Name
  final filmNameController = TextEditingController();

  Color pickerColor = Color.fromRGBO(106, 0, 219, 1);
  final df = DateFormat('hh:mm a, dd-MM-yyyy');

  Color currentColor = Color.fromRGBO(106, 0, 219, 1);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() {
      currentColor = color;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainSecondaryColor,
        title: Text("Watch Together Event!"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 45,
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

              SizedBox(
                height: 10,
              ),

              /// Watch Time
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  trailing: Icon(
                    Icons.timelapse,
                    size: 30,
                  ),
                  title: dateTime == null
                      ? Text(
                          "Select Watch Time",
                        )
                      : Text(
                          df.format(dateTime),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: currentColor,
                          ),
                        ),
                  onTap: () {
                    DatePicker.showDateTimePicker(
                      context,
                      maxTime: DateTime.now().add(Duration(days: 4)),
                      minTime: DateTime.now().add(Duration(hours: 1)),
                      currentTime: DateTime.now().add(Duration(hours: 1)),
                      onCancel: () {
                        setState(() {
                          dateTime = null;
                        });
                      },
                      onConfirm: (time) {
                        setState(() {
                          dateTime = time;
                        });
                      },
                      showTitleActions: true,
                    );
                  },
                ),
              ),

              /// Color Picker
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  title: const Text(
                    'Select Label Color For Event!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: currentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select a Color'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(
                height: 50,
              ),

              /// Share
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text(
                    "Create",
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
                      if (!formKey.currentState.validate()) {
                        return;
                      }
                      if (dateTime == null) {
                        Fluttertoast.showToast(msg: "Select Watch Time");
                        return;
                      }

                      final event = FilmEvent(
                        creatorNickname: currentUser.nickname,
                        creatorUid: currentUser.uid,
                        filmName: filmNameController.text,
                        label: currentColor,
                        toWatchPeople: [],
                        toWatchTime: Timestamp.fromDate(dateTime),
                      );

                      /// Create New Event
                      await createEvent(
                        context,
                        event,
                      );

                      Fluttertoast.showToast(msg: "Event Shared!");
                      Navigator.of(context).pop();
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
