import 'package:flutter/material.dart';

import 'component/Auth.dart';

class FingerPrintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Authentication FingerPrint",
      home: Auth(),
    );
  }
}
