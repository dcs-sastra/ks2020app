import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ]);

  Future<bool> anonymousSignIn() async {
    return (await _auth.signInAnonymously()) != null;
  }

  Future<bool> signIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    if (authResult.additionalUserInfo.isNewUser) {}
    return authResult == null;
  }

  Future<void> logout() async {
    if ((await _auth.currentUser()).isAnonymous) {
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'deleteUser',
      );
      HttpsCallableResult resp = await callable.call();
      print(resp.data);
    }

    _auth.signOut();
    _googleSignIn.signOut();
  }

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }
}
