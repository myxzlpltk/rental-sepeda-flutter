import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';
import 'package:rental_sepeda_flutter/services/station_services.dart';

class SearchProvider extends ChangeNotifier {
  late BuildContext _context;
  SearchProvider(BuildContext context) {
    _context = context;
  }

  GoogleMapController? _controller;
  GoogleMapController? get controller => _controller;
  bool get isMapLoaded => controller != null;
  List<Station> stations = [];

  TextEditingController searchController =
      TextEditingController(text: "Universitas Negeri Malang");

  final CameraPosition initialCam = CameraPosition(
    target: LatLng(-7.9606, 112.6173),
    zoom: 15,
  );
  LatLng location = LatLng(-7.9606, 112.6173);

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
    loadNearby();
  }

  Timer? _timer1;
  void onCameraMove(CameraPosition cameraPosition) {
    if (_timer1 != null && _timer1!.isActive) _timer1!.cancel();

    _timer1 = Timer(Duration(seconds: 1), () async {
      location = LatLng(
          cameraPosition.target.latitude, cameraPosition.target.longitude);

      updateAddress();
      loadNearby();
    });
  }

  void loadNearby() async {
    stations =
        await StationServices.nearby(location.latitude, location.longitude);
    notifyListeners();
  }

  void searchAddress() async {
    List<Location> locations = await locationFromAddress(searchController.text,
        localeIdentifier: 'id_ID');

    if (locations.isEmpty) return;
    location = LatLng(locations.first.latitude, locations.first.longitude);
    controller!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 15)));
    FocusScope.of(_context).unfocus();
  }

  Future updateAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude, location.longitude,
        localeIdentifier: "id_ID");
    if (placemarks.isEmpty) return;

    List<String?> address = [
      placemarks.first.street,
      placemarks.first.postalCode,
      placemarks.first.subLocality,
      placemarks.first.locality,
      placemarks.first.subAdministrativeArea,
      placemarks.first.administrativeArea,
    ]..removeWhere((e) => e == null || e.isEmpty);
    String newValue = address.join(", ");
    searchController.value = TextEditingValue(
      text: newValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newValue.length),
      ),
    );

    stations =
        await StationServices.nearby(location.latitude, location.longitude);
    notifyListeners();
  }
}
