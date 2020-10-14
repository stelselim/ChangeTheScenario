import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:changescenario/utility/bookmarkFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePostTab extends StatelessWidget {
  const ProfilePostTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userUid = Provider.of<UserState>(context, listen: false).user.uid;

    /// Get Posts For This User
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(scenariosColletion)
            .where("writerUID", isEqualTo: userUid)
            .orderBy("postTime", descending: true)
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
              final localscenario = Scenario.fromMap(
                snapshot.data.docs.elementAt(index).data(),
              );
              final docRef = snapshot.data.docs.elementAt(index).reference;
              final userUid =
                  Provider.of<UserState>(context, listen: false).user.uid;

              /// Scenario Post Cards
              return FutureBuilder<bool>(
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

                    return ScenarioPostCard(
                      isFavoritedInitial: isFav.data,
                      documentReference: docRef,
                      scenario: localscenario,
                      userUid: userUid,
                    );
                  });
            },
          );
        });
  }
}
