import 'dart:io';

import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/utility/bookmarkFunctions.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScenarioPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const ScenarioPage({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  _ScenarioPageState createState() => _ScenarioPageState();
}

class _ScenarioPageState extends State<ScenarioPage> {
  final ScrollController scrollController = ScrollController();
  List scenariousDocs = []; // Scenarious

  /// Scenario Page Stream

  @override
  void initState() {
    super.initState();
  }

  Future getScenarious() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      setStatusBarColorLight();
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () async {
        // Refresh Posts
        setState(() {});
        await Future.delayed(Duration(milliseconds: 500));
        print("Refreshing");
      },
      child: Column(
        children: [
          appBarWithText(
            scaffoldKey: widget.scaffoldKey,
            height: height,
            context: context,
            title: "Change Scenarios",
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(scenariosColletion)
                  .orderBy("postTime", descending: true)
                  .limit(50)
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

                /// Get Docs From Stream
                scenariousDocs = snapshot.data.docs;

                return ListView.builder(
                  itemCount: scenariousDocs.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 5, bottom: 60),
                  physics: ClampingScrollPhysics(),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    /// Local Scenario
                    final localscenario = Scenario.fromMap(
                      scenariousDocs.elementAt(index).data(),
                    );
                    final docSnapshot = scenariousDocs.elementAt(index);
                    final userUid =
                        Provider.of<UserState>(context, listen: false).user.uid;

                    /// Scenario Post Cards
                    return FutureBuilder<bool>(
                      future: isFavoritedPost(docSnapshot.id),
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
                          setStateParent: setState,
                          isFavoritedInitial: isFav.data,
                          documentReference: docSnapshot.reference,
                          scenario: localscenario,
                          userUid: userUid,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
