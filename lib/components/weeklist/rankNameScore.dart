import 'package:flutter/material.dart';

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
            child: Text(
              "Score",
              style: rankNameScoreTextStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
