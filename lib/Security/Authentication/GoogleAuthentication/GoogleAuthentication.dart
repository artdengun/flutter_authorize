import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthentication {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  // sign in with google
  static Future<SignInSignUpGoogle> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final AuthResult result = await _auth.signInWithCredential(credential);
      return SignInSignUpGoogle(user: result.user);
    } catch (e) {
      return SignInSignUpGoogle(message: e.toString());
    }
  }

  // sign out google
  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }
}

class SignInSignUpGoogle {
  final FirebaseUser user;
  final String message;

  SignInSignUpGoogle({this.user, this.message});
}
