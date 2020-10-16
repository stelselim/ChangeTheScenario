import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Event.dart';
import 'package:changescenario/utility/bookmarkFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEventTab extends StatelessWidget {
  const ProfileEventTab({
    Key key,
    @required this.userUid,
  }) : super(key: key);

  final String userUid;

  @override
  Widget build(BuildContext context) {
    /// Get Posts For This User
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(eventsCollection)
          .where("creatorUid", isEqualTo: userUid)
          .orderBy("toWatchTime", descending: true)
          .limit(20)
          .get()
          .asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("An Error Occured"));
        }

        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 5),
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            /// Local Scenario
            final localEvent = FilmEvent.fromMap(
              snapshot.data.docs.elementAt(index).data(),
            );
            final docRef = snapshot.data.docs.elementAt(index).reference;
            final userUid =
                Provider.of<UserState>(context, listen: false).user.uid;

            /// Scenario Post Cards
            return StatefulBuilder(
              builder: (context, setState) => FutureBuilder<bool>(
                future: isFavoritedPost(docRef.id),
                builder: (context, isFav) {
                  if (isFav.hasError) {
                    // print("Problem");
                    return Container();
                  }
                  if (isFav.data == null) {
                    // print("Problem Data NUll");
                    return Container();
                  }

                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(localEvent.toWatchTime.toDate().toString()),
                          Text(
                            localEvent.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
