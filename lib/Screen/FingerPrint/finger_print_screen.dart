import 'package:auth/Security/Authentication/FingerAuthentication/FingerAuthentication.dart';
import 'package:flutter/material.dart';

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
