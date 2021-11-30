import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';

class TopUpServices {
  TopUpServices._();

  static final CollectionReference _topUps =
      FirebaseFirestore.instance.collection("top-ups");

  static Future<TopUp> create(TopUp topUp) async {
    String id = _topUps.doc().id;
    await _topUps.doc(id).set(topUp.toMap());

    return await get(id) as TopUp;
  }

  static Future<TopUp?> get(String id) async {
    final doc = await _topUps.doc(id).get();
    return TopUp.fromDocument(doc);
  }
}
