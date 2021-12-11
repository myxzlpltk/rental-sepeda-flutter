import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

class Station extends Equatable {
  final String id;
  final String name;
  final String address;
  final String photoURL;
  final int openHour;
  final int closeHour;
  final GeoPoint geoPoint;
  final String geoHash;
  final double distance;
  final int totalCycles;
  final Promo promo;
  final Specification specs;

  const Station({
    required this.id,
    required this.name,
    required this.address,
    required this.photoURL,
    required this.openHour,
    required this.closeHour,
    required this.geoPoint,
    required this.geoHash,
    required this.distance,
    required this.totalCycles,
    required this.promo,
    required this.specs,
  });

  static const Station dummy = Station(
    id: '0',
    name: "Stasiun",
    address: "Jl. Soekarno Hatta",
    photoURL: "",
    openHour: 0,
    closeHour: 0,
    geoPoint: GeoPoint(0, 0),
    geoHash: "",
    distance: 0,
    totalCycles: 0,
    promo: Promo(discount: 0),
    specs: Specification(
      price: 0,
      photoURL: "0",
      usage: 0,
      rent: 0,
      repaired: 0,
      speed: 0,
      battery: 0,
      seats: 0,
    ),
  );

  @override
  List<Object?> get props => [id];

  String get humanDistance => (distance < 1)
      ? "${(distance * 1000).toStringAsFixed(0)} m"
      : "${(distance).toStringAsFixed(1)} km";

  int get discountPrice => (specs.price - promo.discount * specs.price).toInt();

  factory Station.fromDocument(DocumentSnapshot doc, [GeoFirePoint? center]) {
    return Station(
      id: doc.id,
      name: doc.get('name'),
      address: doc.get('address'),
      photoURL: doc.get('photoURL'),
      openHour: doc.get('openHour'),
      closeHour: doc.get('closeHour'),
      geoPoint: doc.get('point.geopoint'),
      geoHash: doc.get('point.geohash'),
      distance: center == null
          ? 0
          : center.distance(
              lat: doc.get('point.geopoint').latitude,
              lng: doc.get('point.geopoint').longitude),
      totalCycles: doc.get('totalCycles'),
      promo: Promo(
        discount: doc.get('promo.discount').toDouble(),
        expiredAt: doc.get('promo.expiredAt')?.toDate(),
      ),
      specs: Specification(
        price: doc.get('specs.price'),
        photoURL: doc.get('specs.photoURL'),
        usage: doc.get('specs.usage'),
        rent: doc.get('specs.rent'),
        repaired: doc.get('specs.repaired'),
        speed: doc.get('specs.speed'),
        battery: doc.get('specs.battery'),
        seats: doc.get('specs.seats'),
      ),
    );
  }
}

class Promo {
  final double discount;
  final DateTime? expiredAt;

  const Promo({required this.discount, this.expiredAt});
}

class Specification {
  final int price;
  final String photoURL;
  final int usage;
  final int rent;
  final int repaired;
  final int speed;
  final int battery;
  final int seats;

  const Specification({
    required this.price,
    required this.photoURL,
    required this.usage,
    required this.rent,
    required this.repaired,
    required this.speed,
    required this.battery,
    required this.seats,
  });
}
