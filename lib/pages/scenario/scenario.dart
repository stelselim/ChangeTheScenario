import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/scenario/postCard.dart';
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

  /// Scenario Page Stream
  final scenarioPageStream = FirebaseFirestore.instance
      .collection(scenariosColletion)
      .orderBy("postTime", descending: true)
      .limit(20)
      .get()
      .asStream();

  @override
  void initState() {
    super.initState();
    // Should Listen Scroll Controller
    // scrollController.
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColorLight();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 500));
        print("Refreshing");
        setState(() {});
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
              stream: scenarioPageStream,
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
                  padding: EdgeInsets.only(top: 5, bottom: 60),
                  physics: ClampingScrollPhysics(),
                  controller: scrollController,
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
