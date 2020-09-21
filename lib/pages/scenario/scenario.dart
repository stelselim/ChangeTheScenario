import 'package:changescenario/components/appBarWithText.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Dummy Data => Scenarios
///
final String title = "Spiderman should not end like that!";
final String film = "The Amazing Spiderman 2";
final String scriptChanger = "Stelselim";
final DateTime postTime = DateTime(2020, 10, 2, 5, 17, 30);
// final Duration postTime =
//     DateTime(2020, 10, 2, 5, 17, 30).difference(DateTime.now());
final int like = 22;
final int dislike = 14;
final String script =
    "Spider-Man embarks on a mission to protect his loved ones when OsCorp, owned by his childhood friend Harry Osborn, unleashes a slew of genetically-modified villains against him.";
// final String writeDocID = "";
// final List<ScenarioComment> comments // Create ScenarioComment Class

class ScenarioPage extends StatefulWidget {
  const ScenarioPage({Key key}) : super(key: key);

  @override
  _ScenarioPageState createState() => _ScenarioPageState();
}

class _ScenarioPageState extends State<ScenarioPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Should Listen Scroll Controller
    // scrollController.
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          appBarWithText(
            height: height,
            title: "Change Scenarios",
            textColor: Colors.blue.shade700,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              controller: scrollController,
              itemBuilder: (context, index) {
                /// Scenario Post Cards
                return Container(
                  height: 240,
                  margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$title",
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: GestureDetector(
                                    child: Icon(Icons.more_vert),
                                    onTap: () {
                                      print(
                                          "Taaped More Settings in Scenario Card");
                                      Fluttertoast.showToast(
                                          msg: "Report or Settings");
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("$scriptChanger"),
                                // Text("${postTime.inMinutes} Ago")
                                Text(
                                    "~ ${postTime.month}-${postTime.day}-${postTime.year}"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("$film"),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("$script"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Comments Bar
                              Row(
                                children: [
                                  Text("Comments"),
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.comment,
                                      color: Colors.blue.shade200,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),

                              /// Like - Dislike Bar
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  /// Dislike
                                  Row(
                                    children: [
                                      Text("$dislike"),
                                      IconButton(
                                        icon: FaIcon(
                                          Icons.thumb_down,
                                          color: Colors.blue.shade100,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),

                                  /// Like
                                  Row(
                                    children: [
                                      Text("$like"),
                                      IconButton(
                                        icon: FaIcon(
                                          Icons.thumb_up,
                                          color: Colors.blue.shade100,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
