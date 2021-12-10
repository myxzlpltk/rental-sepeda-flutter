import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';

class StationServices {
  StationServices._();

  static final CollectionReference _stations =
      FirebaseFirestore.instance.collection("stations");

  static Future<List<Station>> nearby(double latitude, double longitude) async {
    final geo = GeoFlutterFire();

    GeoFirePoint center = geo.point(latitude: latitude, longitude: longitude);
    double radius = 20;
    String field = "point";
    List<DocumentSnapshot> snapshots = await geo
        .collection(collectionRef: _stations)
        .within(center: center, radius: radius, field: field)
        .first;

    List<Station> data =
        snapshots.map((e) => Station.fromDocument(e, center)).toList();
    data.sort((a, b) => a.distance.compareTo(b.distance));

    return data;
  }
}
