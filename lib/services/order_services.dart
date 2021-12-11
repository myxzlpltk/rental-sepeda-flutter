import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_sepeda_flutter/models/order_model.dart';

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
    final station = await doc.get('station').get();
    final user = await doc.get('user').get();

    return Order.fromDocument(doc, station, user);
  }
}
