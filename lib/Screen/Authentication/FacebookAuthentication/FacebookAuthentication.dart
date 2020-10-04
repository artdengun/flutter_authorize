import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuthentication {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static FacebookLogin facebookLogin = FacebookLogin();

  // sign in with facebook
  static Future<SignInSignUpFacebook> signInWithFacebook() async {
    try {
      facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
      final FacebookLoginResult result = await facebookLogin.logIn(['email']);
      final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);

      return SignInSignUpFacebook(user: authResult.user);
    } catch (e) {
      return SignInSignUpFacebook(message: e.toString());
    }
  }

  // sign in with facebook
  static Future<void> signOutWithFacebook() async {
    await facebookLogin.logOut();
  }
}

class SignInSignUpFacebook {
  final FirebaseUser user;
  final String message;

  SignInSignUpFacebook({this.user, this.message});
}
