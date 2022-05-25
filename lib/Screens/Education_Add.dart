import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyolite/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Experience_Add.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EducationAdd(),
  ));
}

class EducationAdd extends StatefulWidget {
  @override
  _EducationAddState createState() => _EducationAddState();
}

class _EducationAddState extends State<EducationAdd> {
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
                    "Education",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Add New Education Qualifications",
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
      decoration: InputDecoration(labelText: 'Qualification'),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return "Name is Required";
        }
      },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Organization() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'College / Place'),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return "Organization is Required";
        }
      },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Duration() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Duration (eg: 2011-2012)'),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return "Duration is Required";
        }
      },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

Widget _Location() {
  return TextFormField(
      decoration: InputDecoration(labelText: 'Location (eg: Chennai)'),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return "Location is Required";
        }
      },
      onSaved: (value) {
        //_Staff_Email = value;
      });
}

List<PlatformFile> _files;

void uploadImage() async {
  final uri =
      Uri.parse('http://192.168.56.1/teachers_diary/lib/Db/fileupload.php');
  var request = http.MultipartRequest('POST', uri);
  request.fields['name'] = _files.first.path.toString().split("/").last;
  request.fields['path'] = _files.first.path.toString();
  var pic = await http.MultipartFile.fromPath(
      "filePath", _files.first.path.toString());
  request.files.add(pic);
  var response = await request.send();

  if (response.statusCode == 200) {
    print(_files);
    print('Image Uploded');
  } else {
    print('Image Not Uploded');
  }
  // setState(() {});
}

void _openFileExplorer() async {
  _files = (await FilePicker.platform.pickFiles(
          type: FileType.any, allowMultiple: false, allowedExtensions: null))
      .files;

  print('Loaded file path is : ${_files.first.path}');
}

//Snack Bar

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Files Uploaded Successfully.'),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Upload Files'),
      ),
    );
  }
}
