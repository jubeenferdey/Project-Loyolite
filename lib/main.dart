import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:loyolite/Homepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 100),
            child: AnimatedSplashScreen(
              nextScreen: MyApp(),
              splash: Image.asset('assets/images/Loyola.png'),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 305,
              animationDuration: Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          ))));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Nunito"),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              child: Center(child: WelcomePage()),
            )));
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _pageState = 0;

  var _bgcolor = Colors.white;
  var _headingColor = Colors.white;
  var _subHeadingColor = Colors.black;
  double _createAccHeight = 0;

  double _loginXoffset = 0;
  double _loginYoffset = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;
  double _loginHeight = 0;

  double _signUpYoffset = 0;

  double _welcomeMargin = 100;
  double windowWidth = 0;
  double windowHeight = 0;

  double _pwdResetHeight = 0;
  double _pwdYOffset = 0;
  double _pwdOpacity = 0;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print(
        'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool keyboardVisible) {
      print('Keyboard visibility update. Is visible: $keyboardVisible');
      _keyboardVisible = keyboardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowHeight - 300;
    _createAccHeight = windowHeight - 300;
    _pwdResetHeight = windowHeight - 300;
    switch (_pageState) {
      case 0:
        _bgcolor = Colors.white;
        _headingColor = Colors.blue[900];
        _subHeadingColor = Colors.black;
        _loginXoffset = 0;
        _loginYoffset = windowHeight;
        _signUpYoffset = windowHeight;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _welcomeMargin = 100;
        // _loginHeight = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        break;

      case 1:
        _bgcolor = Colors.blue[800];
        _headingColor = Colors.white;
        _subHeadingColor = Colors.white;
        _loginXoffset = 0;
        //_loginYoffset = 300;
        _signUpYoffset = windowHeight;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _welcomeMargin = 90;
        _loginHeight = windowHeight;
        _loginYoffset = _keyboardVisible ? 40 : 300;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 300;

        break;

      case 2:
        _bgcolor = Colors.blue[800];
        _headingColor = Colors.white;
        _subHeadingColor = Colors.white;
        _loginXoffset = 20;
        //_loginYoffset = 270;
        _signUpYoffset = 300;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _pwdOpacity = 0;
        _welcomeMargin = 80;

        _loginYoffset = _keyboardVisible ? 30 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _signUpYoffset = _keyboardVisible ? 55 : 270;
        _createAccHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        break;

      case 3:
        _bgcolor = Colors.red[800];
        _headingColor = Colors.white;
        _subHeadingColor = Colors.white;
        _loginXoffset = 20;
        //_loginYoffset = 270;
        _pwdYOffset = 270;
        _pwdOpacity = 1;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _welcomeMargin = 80;

        _loginYoffset = _keyboardVisible ? 30 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _signUpYoffset = _keyboardVisible ? 55 : 270;
        _createAccHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1500),
          color: _bgcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                    child: Column(
                  children: [
                    AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 1500),
                        margin: EdgeInsets.only(top: _welcomeMargin),
                        child: Text('Welcome, User! ',
                            style:
                                TextStyle(color: _headingColor, fontSize: 30))),
                    SizedBox(height: 3),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                          'Loyola Diary allows you to Safely Upload your Certificates and retrieve them, whenever needed :) ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            color: _subHeadingColor,
                          )),
                    )
                  ],
                )),
              ),

              // Welcome Container
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  //child: Image.asset('assets/images/Loyola.png')
                ),
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_pageState != 0) {
                      _pageState = 0;
                    } else {
                      _pageState = 1;
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    'Get Started!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )),
                ),
              ))
            ],
          ),
        ),
        // Login Container

        AnimatedContainer(
          padding: EdgeInsets.all(32),
          height: _loginHeight,
          width: _loginWidth,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginXoffset, _loginYoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Login to Continue',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              InputwithIcon(icon: Icons.email, hint: "Institutional Mail"),
              SizedBox(height: 20),
              InputwithIcon(
                  icon: Icons.password, hint: "Password", obscure: true),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 3;
                  });
                },
                child: Container(
                    child: Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                )),
              ),
              SizedBox(height: 140),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: PrimaryButton(buttonName: "Login")),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: SecButton(
                      secButtonName: "Create an Account",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

        // SignUp Container

        AnimatedContainer(
          height: _createAccHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _signUpYoffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Create a New Account',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              InputwithIcon(
                  icon: Icons.email, hint: "Enter your Institutional Mail"),
              SizedBox(height: 20),
              InputwithIcon(
                icon: Icons.password_rounded,
                hint: "Enter your Password",
                obscure: true,
              ),
              SizedBox(height: 210),
              Column(
                children: [
                  PrimaryButton(buttonName: "Create Account "),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: SecButton(
                      secButtonName: "Back to Login",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // forgot pwd module

        // AnimatedContainer(
        //   padding: EdgeInsets.all(32),
        //   height: _pwdResetHeight,
        //   curve: Curves.fastLinearToSlowEaseIn,
        //   duration: Duration(milliseconds: 1000),
        //   transform: Matrix4.translationValues(0, 0, 1),
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(bottom: 20),
        //         child: Text(
        //           'Reset Your Password',
        //           style: TextStyle(fontSize: 23),
        //         ),
        //       ),
        //       InputwithIcon(
        //           icon: Icons.email, hint: "Enter your Institutional Mail"),
        //       SizedBox(height: 20),
        //       GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             _pageState = 0;
        //           });
        //         },
        //         child: Container(
        //             margin: EdgeInsets.symmetric(horizontal: 32),
        //             child: PrimaryButton(buttonName: "Reset! ")),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class InputwithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  InputwithIcon({this.icon, this.hint, this.obscure = false});
  @override
  _InputwithIconState createState() => _InputwithIconState();
}

class _InputwithIconState extends State<InputwithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400], width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Container(
        child: Row(
          children: [
            Container(
                width: 80,
                child: Icon(widget.icon, size: 20, color: Color(0xFFBB9B9B9))),
            Expanded(
                child: TextField(
              obscureText: widget.obscure,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String buttonName;

  PrimaryButton({this.buttonName});

  @override
  PrimaryButtonState createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[800], borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class SecButton extends StatefulWidget {
  final String secButtonName;

  SecButton({this.secButtonName});

  @override
  _SecButtonState createState() => _SecButtonState();
}

class _SecButtonState extends State<SecButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue[800],
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.secButtonName,
          style: TextStyle(color: Colors.blue[800], fontSize: 20),
        ),
      ),
    );
  }
}
