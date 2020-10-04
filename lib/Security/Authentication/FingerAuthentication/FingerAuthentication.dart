import 'package:auth/Screen/FingerPrint/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // variable authentication
  LocalAuthentication _auth = LocalAuthentication();
  // check apakah smartphone support dengan biometric atau tidak
  bool _checkBio = false;
  bool _isBioFinger = false;

  @override
  void initState() {
    super.initState();
    _checkBiometric();
    _listsBioAndFindFingerType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.fingerprint,
                size: 50,
              ),
              onPressed: _startAuth,
              iconSize: 60,
            ),
            SizedBox(height: 15),
            Text("Masuk Untuk Melihat"),
          ],
        ),
      ),
    );
  }

  // kita check apakah smartphone yang kita pakai support atau tidak dengan biometric

  void _checkBiometric() async {
    try {
      final bio = await _auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
      });

      print('Biometrics = $_checkBio');
    } catch (e) {}
  }

  void _listsBioAndFindFingerType() async {
    List<BiometricType> _listType;
    try {
      _listType = await _auth.getAvailableBiometrics();
    } catch (e) {
      print(e.message);
    }

    print('List Biometric = $_listType');

    if (_listType.contains(BiometricType.fingerprint)) {
      setState(() {
        _isBioFinger = true;
      });
      print('Finger is $_isBioFinger');
    }
  }

// proses authentication

  void _startAuth() async {
    bool _isAuthenticated = false;
    // ini untuk pesan ketika popup finger print muncul
    AndroidAuthMessages _androidMsg = AndroidAuthMessages(
        signInTitle: 'Finger Jari Anda Disini',
        fingerprintHint: 'letakan jari anda pada touch finger',
        cancelButton: 'tutup finger pop up');
    try {
      _isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint',
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: _androidMsg,
        // iOSAuthStrings: null
      );
    } on PlatformException catch (e) {
      print(e.message);
    }
    if (_isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => Home()));
    }
  }
}
