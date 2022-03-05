import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/Services/FirebaseManager.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signIn(
      {String email,
      String password,
      BuildContext context,
      final GlobalKey<FormState> key}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      // key.currentState.save();

      final snackBar = SnackBar(content: Text('Welcome!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

      return "Signed in Successfully.";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({
    String email,
    String password,
    BuildContext context,
    //GlobalKey<FormState> key
  }) async {
    User firebaseUser = FirebaseAuth.instance.currentUser;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      createUserInDatabase(firebaseUser);
      profileCreation(firebaseUser);
      //key.currentState.save();
      CircularProgressIndicator();
      final snackBar = SnackBar(content: Text('Account Created Successfully'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      return "Signed Up Successfully.";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut({BuildContext context}) async {
    await _firebaseAuth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
}
