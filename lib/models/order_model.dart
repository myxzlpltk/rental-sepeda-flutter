import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/models/user_model.dart';
import 'package:rental_sepeda_flutter/services/station_services.dart';
import 'package:rental_sepeda_flutter/services/user_services.dart';

class Order extends Equatable {
  final String id;
  final int price;
  final int days;
  final DateTime createdAt;
  final DateTime expiredAt;
  final String status;
  final Station station;
  final AppUser user;

  const Order({
    required this.id,
    required this.price,
    required this.days,
    required this.createdAt,
    required this.expiredAt,
    this.status = StatusOrder.waiting,
    required this.station,
    required this.user,
  });

  static Order dummy = Order(
    id: '1234567890',
    price: 50000,
    days: 1,
    createdAt: DateTime.now(),
    expiredAt: DateTime.now(),
    user: AppUser.dummy,
    station: Station.dummy,
  );

  @override
  List<Object?> get props => [id];

  int get total => price * days;

  factory Order.fromDocument(
      DocumentSnapshot doc, Station station, AppUser user) {
    return Order(
      id: doc.id,
      price: doc.get('price'),
      days: doc.get('days'),
      createdAt: doc.get('createdAt').toDate(),
      expiredAt: doc.get('expiredAt').toDate(),
      status: doc.get('status'),
      station: station,
      user: user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'days': days,
      'createdAt': createdAt,
      'expiredAt': expiredAt,
      'status': status,
      'station': StationServices.collectionRef.doc(station.id),
      'user': UserServices.collectionRef.doc(user.id),
    };
  }
}

class StatusOrder {
  static const String waiting = "waiting";
  static const String picked = "picked";
  static const String completed = "completed";
}
