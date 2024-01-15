import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String fullname;
  final String height;
  final String age;
  final String weight;

  const User(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.fullname,
      required this.height,
      required this.weight,
      required this.age});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'photoUrl': photoUrl,
        'email': email,
        'fullname': fullname,
        'height': height,
        'weight': weight,
        'age': age,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      fullname: snapshot['fullname'],
      height: snapshot['height'],
      weight: snapshot['weight'],
      age: snapshot['age'],
    );
  }
}
