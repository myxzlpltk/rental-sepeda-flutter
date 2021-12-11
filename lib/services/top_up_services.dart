import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';

class TopUpServices {
  TopUpServices._();

  static final CollectionReference collectionRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('top-ups');

  static Future<TopUp> create(TopUp topUp) async {
    String id = collectionRef.doc().id;
    await collectionRef.doc(id).set(topUp.toMap());

    return await get(id) as TopUp;
  }

  static Future<TopUp?> get(String id) async {
    final doc = await collectionRef.doc(id).get();
    return TopUp.fromDocument(doc);
  }

  static Query<Object?> queryList() {
    return collectionRef.orderBy('createdAt', descending: true);
  }
}
