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
  });

  @override
  List<Object?> get props => [id];

  String get humanDistance => (distance < 1)
      ? "${(distance * 1000).toStringAsFixed(0)} m"
      : "${(distance).toStringAsFixed(1)} km";

  factory Station.fromDocument(DocumentSnapshot doc, GeoFirePoint center) {
    return Station(
      id: doc.id,
      name: doc.get('name'),
      address: doc.get('address'),
      photoURL: doc.get('photoURL'),
      openHour: doc.get('openHour'),
      closeHour: doc.get('closeHour'),
      geoPoint: doc.get('point.geopoint'),
      geoHash: doc.get('point.geohash'),
      distance: center.distance(
        lat: doc.get('point.geopoint').latitude,
        lng: doc.get('point.geopoint').longitude,
      ),
      totalCycles: doc.get('totalCycles'),
    );
  }
}
