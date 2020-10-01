import 'package:changescenario/styles/color/colors.dart';
import 'package:flutter/material.dart';

/// Take Bookmarks from local database

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainSecondaryColor,
        title: Text("Scenarios You Saved!"),
      ),
      body: Center(
        child: Text("Bookmarks"),
      ),
    );
  }
}
