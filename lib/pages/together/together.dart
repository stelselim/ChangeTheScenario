import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Event.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/event/eventCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TogetherPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TogetherPage({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  _TogetherPageState createState() => _TogetherPageState();
}

class _TogetherPageState extends State<TogetherPage> {
  final ScrollController scrollController = ScrollController();

  List<QueryDocumentSnapshot> eventDocs = []; // Scenarious

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
            context: context,
            height: MediaQuery.of(context).size.height,
            title: "Watch Together",
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(eventsCollection)
                  .orderBy("toWatchTime", descending: false)
                  .where("toWatchTime", isGreaterThan: DateTime.now())
                  // .limit(20)
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
                eventDocs = snapshot.data.docs;

                return ListView.builder(
                  itemCount: eventDocs.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 5, bottom: 60),
                  physics: ClampingScrollPhysics(),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    /// Local Scenario
                    final filmEvent = FilmEvent.fromMap(
                      eventDocs.elementAt(index).data(),
                    );
                    final docSnapshot = eventDocs.elementAt(index);
                    final userUid =
                        Provider.of<UserState>(context, listen: false).user.uid;

                    /// Scenario Event Cards
                    return EventCard(
                      setStateParent: setState,
                      filmEvent: filmEvent,
                      documentReference: eventDocs.elementAt(index).reference,
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
