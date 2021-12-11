import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class OrderServices {
  OrderServices._();

  static final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('orders');

  static Future<Order> create(Order order) async {
    String id = collectionRef.doc().id;
    await collectionRef.doc(id).set(order.toMap());

    return await get(id) as Order;
  }

  static Future<Order?> get(String id) async {
    final doc = await collectionRef.doc(id).get();
    final station = Station.fromDocument(await doc.get('station').get());
    final user = AppUser.fromDocument(await doc.get('user').get());

    return Order.fromDocument(doc, station, user);
  }

  static Query<Object?> previousQueryList() {
    return collectionRef
        .where('user',
            isEqualTo: UserServices.collectionRef
                .doc(FirebaseAuth.instance.currentUser?.uid))
        .orderBy('createdAt', descending: true);
  }
}
