import 'package:flutter/material.dart';
import 'package:robofit/model/nameget.dart';
import 'package:robofit/resources/firestore_methods.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Loading", email: "Loading");

  Future getData() async {
    userDetails = await FireStoreMethods().getNameAndAddress();
    notifyListeners();
  }
}
