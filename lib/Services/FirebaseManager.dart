import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loyolite/Screens/Home/Signup_1.dart';
import 'package:loyolite/Screens/Home/Signup_2.dart';
import 'package:loyolite/Screens/Authentication/Firebase.dart';

//Creating User in Database
void createUserInDatabase(User firebaseUser) async {
  User firebaseUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(firstName)
      .set({'Name': firstName, 'Email': Email, 'Staff ID': staff_ID})
      .whenComplete(() =>
          print('Created user in database. Name: $firstName | Email: $Email'))
      .catchError((error) {
        print(error.toString());
      });
}

// Profile Creation

void profileCreation(User firebaseUser) async {
  User firebaseUser = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(firstName)
      .collection('User Details')
      .doc('Profile')
      .set({
        'Name': firstName,
        'Email': Email,
        'Staff ID': staff_ID,
        'Shift': Staff_Shift,
        'Age': Staff_Age,
        'Gender': Staff_Gender,
        'Date of Birth': Staff_DOB,
        'Phone': Staff_PhNum,
        'Address': Staff_Address,
        'Department': Staff_Dept,
        'Designation': Staff_Designation,
        'Marrital Status': Staff_MarritalSt,
        'Responsiblity': Staff_Responsiblity,
      })
      .whenComplete(() => print(
          'Created user in database with Google Provider. Name: $firstName | Email: $Email'))
      .catchError((error) {
        print(error.toString());
      });
}

// class Profile {
//   final CollectionReference profileData = FirebaseFirestore.instance
//       .collection('users')
//       .doc(firstName)
//       .collection('User Details');

//   Future getProfileData() async {
//     List profileList = [];

//     try{
//       await profileData.get().then((querySnapshot))
//     } catch(e){

//     }
//   }
// }
