import 'package:flutter/material.dart';
import 'package:loyolite/Screens/Authentication/Wrapper.dart';
import 'package:loyolite/Screens/Authentication/Firebase.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
import 'package:loyolite/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loyolite/models/user.dart';
import 'package:loyolite/Screens/Authentication/Firebase.dart';
import 'package:provider/provider.dart';
//Authentication Wrapper

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
            theme: ThemeData(fontFamily: "Nunito"),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Container(
                  child: Center(child: Authenticate()),
                ))));
  }
}

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print("User is Logged in Already");
      return Home();
    }
    print("Logged Out. Sign In To Continue ");
    return WelcomePage();
  }
}
