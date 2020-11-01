import 'package:changescenario/classes/Event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    @required this.setStateParent,
    @required this.filmEvent,
    @required this.documentReference,
    @required this.userUid,
  }) : super(key: key);

  final Function setStateParent;

  static final df = DateFormat('hh:mm a\t\t dd-MM-yyyy');

  final FilmEvent filmEvent;
  final DocumentReference documentReference;
  final String userUid; // Current user uid for Like

  static final titleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static final usernameTextStyle = TextStyle(
    color: Colors.blue.shade700,
    // decoration: TextDecoration.underline,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final iconcolor = Colors.blue.shade100;
  static final dateTextStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
  static final filmTextStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final scriptTextStyle = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static final commentTextStyle = TextStyle(
    color: Colors.deepPurple.shade900,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final likeDislikeTextStyle = TextStyle(
    color: Colors.deepPurple.shade900,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  filmEvent.filmName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey.shade800,
                    fontSize: 20,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      filmEvent.creatorNickname,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.grey.shade700,
                    size: 32,
                  ),
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "The Notification is set!",
                      gravity: ToastGravity.CENTER,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// Watch Time
              Text(
                df.format(filmEvent.toWatchTime.toDate().toLocal()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: filmEvent.label,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Watchers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: 25,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: filmEvent.toWatchPeople.length,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              child: Text(
                                filmEvent.toWatchPeople
                                    .elementAt(index)
                                    .toString()
                                    .substring(0, 2),
                              ),
                              radius: 15,
                              backgroundColor: filmEvent.label,
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,

                      /// If User == FilmEvent.creatorUid
                      child: userUid == filmEvent.creatorUid
                          ? DropdownButton(
                              isExpanded: true,
                              onChanged: (val) {},
                              underline: Container(),
                              icon: Icon(Icons.more_horiz),
                              items: [
                                DropdownMenuItem(
                                  value: "Delete",
                                  child: Text(
                                    "Delete",
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () async {
                                    try {
                                      await Future.delayed(
                                        Duration(milliseconds: 500),
                                      );
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                height: 120,
                                                width: 500,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ListTile(
                                                      trailing:
                                                          Icon(Icons.delete),
                                                      title: Text(
                                                          "This post is going to be deleted, are you sure?"),
                                                    ),
                                                    ButtonBar(
                                                      children: [
                                                        FlatButton(
                                                            child:
                                                                Text("Cancel"),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                        RaisedButton(
                                                          child: Text("Delete"),
                                                          onPressed: () async {
                                                            try {
                                                              await documentReference
                                                                  .delete();

                                                              Navigator.pop(
                                                                  context);
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg:
                                                                          "Post Deleted, Refresh Page!");
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                          },
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: RaisedButton(
                                color: Colors.indigo.shade100,
                                child: Text(
                                  "JOIN",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blueGrey.shade800,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
