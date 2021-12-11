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
  final DateTime expiredAt;
  final Station station;
  final AppUser user;

  const Order({
    required this.id,
    required this.price,
    required this.days,
    required this.expiredAt,
    required this.station,
    required this.user,
  });

  @override
  List<Object?> get props => [id];

  int get total => price * days;

  factory Order.fromDocument(DocumentSnapshot doc, DocumentSnapshot station, DocumentSnapshot user) {
    return Order(
      id: doc.id,
      price: doc.get('price'),
      days: doc.get('days'),
      expiredAt: doc.get('expiredAt').toDate(),
      station: Station.fromDocument(station),
      user: AppUser.fromDocument(user),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'days': days,
      'expiredAt': expiredAt,
      'station': StationServices.collectionRef.doc(station.id),
      'user': UserServices.collectionRef.doc(user.id),
    };
  }
}
