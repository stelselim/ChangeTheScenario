import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RankNameScore extends StatelessWidget {
  const RankNameScore({
    Key key,
  }) : super(key: key);

  static final rankNameScoreTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.blueGrey.shade800,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "Rank",
              style: rankNameScoreTextStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "Film Names",
              style: rankNameScoreTextStyle,
            ),
          ),
          Expanded(
            flex: 7,
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Up Vote 3 Points, Down Vote -1 Point",
                    gravity: ToastGravity.CENTER);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Score",
                    style: rankNameScoreTextStyle,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.info,
                    color: rankNameScoreTextStyle.color,
                    size: 13,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
