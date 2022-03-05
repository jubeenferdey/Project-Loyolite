import 'package:flutter/cupertino.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Experience_Add.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PublicationAdd(),
  ));
}

class PublicationAdd extends StatefulWidget {
  @override
  _PublicationAddState createState() => _PublicationAddState();
}

class _PublicationAddState extends State<PublicationAdd> {
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
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
                    "Publications",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Add New Publication",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  _Name(),
                  SizedBox(height: 10),
                  _Organization(),
                  SizedBox(height: 10),
                  _Duration(),
                  // SizedBox(height: 10),
                  // _Location(),
                  //_Password(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  // _PasswordCheck(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  SizedBox(height: 60),

                  // GestureDetector(
                  //   onTap: () {
                  //     if (!_formkey2.currentState.validate()) {
                  //       return;

                  //     }
                  //     setState(() {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => ExperienceAdd()));
                  //       _formkey2.currentState.reset();
                  //     });
                  //   },
                  //   child: PrimaryButton(buttonName: "Upload"),
                  // ),
                  SnackBarPage()
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
Widget _Name() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return "Title is Required";
        }
      },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

Widget _Organization() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Patent ID'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return "Organization is Required";
        }
      },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

Widget _Duration() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Published Year '),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return "Duration is Required";
        }
      },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

Widget _Location() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Location (eg: Chennai)'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return "Location is Required";
        }
      },
      onSaved: (String value) {
        //_Staff_Email = value;
      });
}

//Snack Bar

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Publication Uploaded Successfully.'),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Done'),
      ),
    );
  }
}