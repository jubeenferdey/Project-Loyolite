// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:loyolite/models/user.dart';
// import 'package:loyolite/Screens/Home/Signup_2.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

// // create user object based on Firebase user

//   // UserModel _userFromFirebaseUser(User user) {
//   //   return user != null ? UserModel(uid: user.uid) : null;
//   // }
//   // Login with email and password

//   // sign-up with email and password

//   Future signUp() async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);

//       // User user = result.user;
//       // return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // sign-out
// }
