import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:rental_sepeda_flutter/models/user_model.dart';

class UserServices {
  UserServices._();

  static final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");
  static final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  static Future<void> create(AppUser appUser) async {
    await _users.doc(appUser.id).set(appUser.toMap());
  }

  static Future<AppUser?> get(String id) async {
    final doc = await _users.doc(id).get();
    return AppUser.fromDocument(doc);
  }

  static Future<AppUser> update(AppUser appUser) async {
    await _users.doc(appUser.id).update(appUser.toMap());
    return appUser;
  }

  static Future<AppUser> updateWithPhoto(AppUser appUser, File file) async {
    try {
      final task =
          await _storage.ref("users/${appUser.id}/avatar.jpg").putFile(file);

      return await update(
        appUser.copyWith(
          photoURL: await task.ref.getDownloadURL(),
        ),
      );
    } catch (e) {
      return appUser;
    }
  }
}
