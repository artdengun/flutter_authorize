import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthentication {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // create Account
  static Future<SignInSignUpEmail> createUser(
      {String email, String pass}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: pass.trim());
      return SignInSignUpEmail(user: result.user);
    } catch (e) {
      return SignInSignUpEmail(message: e.toString());
    }
  }

  // sign in with email/password
  static Future<SignInSignUpEmail> signInWithEmail(
      {String email, String pass}) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpEmail(user: result.user);
    } catch (e) {
      return SignInSignUpEmail(message: e.toString());
    }
  }

  // sign out
  static void signOut() {
    _auth.signOut();
  }
}

class SignInSignUpEmail {
  final FirebaseUser user;
  final String message;

  SignInSignUpEmail({this.user, this.message});
}
