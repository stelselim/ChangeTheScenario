import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePostTab extends StatelessWidget {
  const ProfilePostTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userUid = Provider.of<UserState>(context, listen: false).user.uid;

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
              final userUid =
                  Provider.of<UserState>(context, listen: false).user.uid;

              /// Scenario Post Cards
              return ScenarioPostCard(
                scenario: localscenario,
                userUid: userUid,
              );
            },
          );
        });
  }
}
