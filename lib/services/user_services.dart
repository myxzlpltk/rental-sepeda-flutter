import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';

class UserServices {
  UserServices._();

  static final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  static Future<void> create(AppUser appUser) async {
    await _users.doc(appUser.id).set({
      'name': appUser.name,
      'email': appUser.email,
      'balance': appUser.balance,
      'photoURL': appUser.photoURL,
    });
  }

  static Future<AppUser?> get(String id) async {
    DocumentSnapshot doc = await _users.doc(id).get();

    return AppUser(
      id: id,
      name: doc.get('name'),
      email: doc.get('email'),
      balance: doc.get('balance'),
      photoURL: doc.get('photoURL'),
    );
  }
}
