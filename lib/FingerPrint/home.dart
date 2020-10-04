import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "WELCOME",
            style: TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}
