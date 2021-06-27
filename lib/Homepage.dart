import 'dart:async';
import 'package:loyolite/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

enum Answers { Upload, Cancel }

class _MainAppState extends State<MainApp> {
  String _value = '';

  void _setValue(String value) {
    setState(() {
      _value = value;
    });
  }

  Future _askUser() async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Simple Dialog!!'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Upload...'),
              onPressed: () {
                Navigator.pop(context, Answers.Upload);
              },
            ),
            SimpleDialogOption(
              child: Text('Cancel...'),
              onPressed: () {
                Navigator.pop(context, Answers.Cancel);
              },
            ),
          ],
        );
      },
    )) {
      case Answers.Upload:
        _setValue('Upload');
        break;
      case Answers.Cancel:
        _setValue('Cancel');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => MainApp()},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.home_rounded),
          backgroundColor: Colors.blueAccent[700],
          title: Container(
            child: Row(
              children: [
                Text("Teacher's Diary"),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 24,
              ),
              splashColor: Colors.pink,
            )
          ],
        ),
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black12),
              height: 300,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: Icon(
                      Icons.upload_rounded,
                      size: 70,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(
                    'Upload a new file',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Click in the button or Drag and drop your file',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    onPressed: _askUser,
                    child: Text('Upload a file'),
                    color: Colors.blueAccent[700],
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueAccent[700],
          currentIndex: 1,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          items: [
            BottomNavigationBarItem(
              label: 'Important',
              icon: Icon(Icons.notification_important_rounded),
            ),
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(
                label: 'My Flies', icon: Icon(Icons.file_present_rounded)),
          ],
        ),
      ),
    );
  }
}
