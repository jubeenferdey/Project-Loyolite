import 'package:flutter/cupertino.dart';
import 'package:loyolite/Screens/Authentication/authProvider.dart';
import 'package:loyolite/Screens/Authentication/Firebase.dart';
import 'package:loyolite/Screens/Home/Home.dart';
import 'package:loyolite/Screens/Home/RootScreen.dart';
import 'package:loyolite/Screens/Responsiblities_add.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loyolite/models/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp());
}

//to store the values
String _Staff_Email, _Staff_password, _Staff_passwordCheck;
String Email = "";

// to  check the email check the passwords
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController _passwordCheck = TextEditingController();

class CreateAccount2 extends StatefulWidget {
  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  // final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();

  //signup

  // Future<void> signUp() async {
  //   try {
  //     UserCredential usercredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: email.text.trim(), password: password.text.trim());

  //     // User user = result.user;
  //     // return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     // return Card(
  //     //   child: Text(e.toString()),
  //     // );
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            _formkey2.currentState.reset();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Create Your ID",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Remember, This is the Credentials you need when you Login again.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  _eMail(),
                  SizedBox(height: 10),
                  _Password(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  _PasswordCheck(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  GestureDetector(
                    onTap: () {
                      // if (!_formkey2.currentState.validate()) {
                      //   return;
                      // }

                      setState(() {
                        context.read<AuthenticationService>().signUp(
                              email: email.text.trim(),
                              password: password.text.trim(),
                              context: context,
                              //key: _formkey2
                            );
                        // signUp();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Home()));
                        // _formkey2.currentState.reset();

                        print(_Staff_Email);
                        print(_Staff_password);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(50),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: PrimaryButton(
                        buttonName: "Next",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Mail
Widget _eMail() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Institutional Mail ID'),
      keyboardType: TextInputType.text,
      controller: email,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return "Mail is Required";
      //   }
      // },
      onChanged: (String value) {
        _Staff_Email = value;
        Email = _Staff_Email;
      });
}

//AGE
Widget _Password() {
  return TextFormField(
    maxLength: 15,

    decoration: InputDecoration(labelText: 'Set a Strong Password'),
    keyboardType: TextInputType.text,
    obscureText: true,
    controller: password,
    // ignore: missing_return
    // validator: (String value) {
    //   if (value.isEmpty) {
    //     return 'Password is Required';
    //   }
    // },
    onChanged: (String value) {
      _Staff_password = value;
    },
  );
}

// ignore: non_constant_identifier_names
Widget _PasswordCheck() {
  return TextFormField(
    maxLength: 15,

    decoration: InputDecoration(
      labelText: 'Re-Enter Password',
    ),
    keyboardType: TextInputType.text,
    obscureText: true,
    controller: _passwordCheck,
    onSaved: (String value) {
      _Staff_passwordCheck = value;
    },
    // ignore: missing_return
    validator: (String value) {
      if (value.isEmpty) {
        return 'Password is Required';
      }
      if (password.text != _passwordCheck.text) {
        return 'Passwords Donot Match!';
      }
      password.text = _Staff_password;
    },
  );
}
