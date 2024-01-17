import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String photoUrl;
  final String email;
  final String fullname;
  final String weight;
  final String height;
  final String age;

  const User({
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.fullname,
    required this.weight,
    required this.height,
    required this.age,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      fullname: snapshot["fullname"],
      weight: snapshot["weight"],
      height: snapshot["height"],
      age: snapshot["age"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "age": age,
        "height": height,
        "weight": weight,
      };
}
