import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/models/top_up_model.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/providers/app_provider.dart';

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

  static Query<Object?> queryList(BuildContext context) {
    AppUser user = Provider.of<AppProvider>(context, listen: false).user!;
    return _topUps
        .where('uid', isEqualTo: user.id)
        .orderBy('createdAt', descending: true);
  }
}
