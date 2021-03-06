import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/utility/bookmarkFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Take Bookmarks from local database

class BookmarksPage extends StatefulWidget {
  final scaffoldKey;
  const BookmarksPage({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBarWithText(
          scaffoldKey: widget.scaffoldKey,
          height: MediaQuery.of(context).size.height,
          context: context,
          title: "Scenarios You Saved!",
        ),
        Expanded(
          child: StreamBuilder<List<String>>(
            stream: getFavoritesDoc().asStream(),
            builder: (context, snapshot) {
              /// An Problem Occured
              if (snapshot.hasError)
                return Center(
                  child: Text("An Error Occured"),
                );

              /// Stream Data Hasn't Come
              if (snapshot.data == null)
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Text(
                      "No Bookmark!",
                      textScaleFactor: 1.6,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey.shade500,
                      ),
                    ),
                  ),
                );

              /// No Bookmark
              if (snapshot.data.length == 0) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Text(
                      "No Bookmark!",
                      textScaleFactor: 1.6,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey.shade500,
                      ),
                    ),
                  ),
                );
              }

              /// List Of Bookmarks
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  /// Get The Document by Doc ID
                  ///

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection(scenariosColletion)
                        .doc(snapshot.data.elementAt(index))
                        .get(),
                    builder: (context, doc) {
                      if (doc.hasError) {
                        return Container();
                      }
                      if (doc.data == null) {
                        return Container();
                      }

                      if (!doc.data.exists) {
                        deleteFromScenarioToBookMark(doc.data.id);
                        return Container();
                      }

                      /// Get Scenario Class from Document Snapshot
                      final localscenario = Scenario.fromMap(doc.data.data());
                      final docRef = doc.data
                          .reference; // Document Reference to Delete or get Doc Id.

                      return ScenarioPostCard(
                        isFavoritedInitial: true,
                        setStateParent: setState,
                        scenario: localscenario,
                        documentReference: docRef,
                        userUid: Provider.of<UserState>(context, listen: false)
                            .user
                            .uid,
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
