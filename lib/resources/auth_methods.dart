import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:robofit/model/user.dart' as model;
import 'package:robofit/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(documentSnapshot);
  }

//sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String fullname,
    required String height,
    required String age,
    required String weight,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          fullname.isNotEmpty ||
          height.isNotEmpty ||
          age.isNotEmpty ||
          weight.isNotEmpty ||
          // ignore: unnecessary_null_comparison
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        model.User user = model.User(
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          fullname: fullname,
          height: height,
          weight: weight,
          age: age,
        );
        await _firestore.collection("users").doc(cred.user!.uid).set(
              user.toJson(),
            );
        res = 'success';
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "invalid email";
      } else if (err.code == 'email-already-in-use') {
        res = "Account Already exists";
      } else if (err.code == 'weak-password') {
        res = "Password Provided is too Weak";
      } else {
        res = "Something Went Wrong!";
      }
    }
    return res;
  }

  //logging in user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = '';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      // Print the error details for debugging
      if (kDebugMode) {
        print("Error during login: $e");
      }

      // Print specific information based on the type of error
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          res = "Wrong Credentials";
        } else {
          res = "An unexpected error occurred during login";
        }
      } else {
        res = "An unexpected error occurred during login";
      }

      // Print additional information from the error, if available
      if (e is FirebaseAuthException && e.message != null) {
        if (kDebugMode) {
          print("Firebase Auth Error Message: ${e.message}");
        }
      }
    }
    return res;
  }

  // Future<String> loginUser(
  //     {required String email, required String password}) async {
  //   String res = '';
  //   if (email.isNotEmpty || password.isNotEmpty) {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     res = 'success';
  //   } else {
  //     res = "Please enter all the fields";
  //   }
  //   // try {
  //   //   if (email.isNotEmpty || password.isNotEmpty) {
  //   //     await _auth.signInWithEmailAndPassword(
  //   //         email: email, password: password);
  //   //     res = 'success';
  //   //   } else {
  //   //     res = "Please enter all the fields";
  //   //   }
  //   // } on FirebaseAuthException catch (e) {
  //   //   if (e.code == 'wrong-password' || e.code == 'wrong-email') {
  //   //     res = "Wrong Credentials";
  //   //   }
  //   // }
  //   return res;
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
