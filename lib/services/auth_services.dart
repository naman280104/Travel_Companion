
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:travel_companion/screens/loading_screen.dart';
import 'package:travel_companion/screens/mainpage.dart';
class AuthService{

  signInWithGoogle() async{
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) => Get.offAll(MainPage()));
  }

  logout()async{
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut().then((value) => Get.offAll(Loading()));
  }

}