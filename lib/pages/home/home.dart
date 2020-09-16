import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Go initial"),
            onPressed: () => Navigator.pushReplacementNamed(context, "/"),
          ),
        ],
      ),
    );
  }
}
