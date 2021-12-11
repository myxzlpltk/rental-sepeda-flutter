import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/services/station_services.dart';

class HomeProvider extends ChangeNotifier {
  late Position? position;

  HomeProvider() {
    refresh();
  }

  List<Station> stations = [];
  Station? promo;

  Future refresh() async {
    position = await Geolocator.getLastKnownPosition();

    return Future.wait([
      fetchPromo(),
      nearbyStation(),
    ]);
  }

  Future nearbyStation() async {
    if (position == null) return;

    stations = await StationServices.nearby(
      position!.latitude,
      position!.longitude,
    );
    notifyListeners();
  }

  Future fetchPromo() async {
    promo = await StationServices.currentPromo();
    notifyListeners();
  }
}
