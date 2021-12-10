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
    toCurrentLocation();
    print("Loaded");
  }

  Timer? _timer1;
  void onCameraMove(CameraPosition cameraPosition) {
    if (_timer1 != null && _timer1!.isActive) _timer1!.cancel();
    if (!pinEnabled) pinEnabled = true;

    _timer1 = Timer(Duration(seconds: 1), () async {
      location = LatLng(
          cameraPosition.target.latitude, cameraPosition.target.longitude);

      updateAddressBasedOnPosition();
      stations =
          await StationServices.nearby(location.latitude, location.longitude);
      notifyListeners();
    });
  }

  void search() async {
    List<Location> locations = await locationFromAddress(searchController.text,
        localeIdentifier: 'id_ID');

    if (locations.isEmpty) return;
    location = LatLng(locations.first.latitude, locations.first.longitude);
    controller!.animateCamera(CameraUpdate.newLatLng(location));
    FocusScope.of(_context).unfocus();
  }

  void toCurrentLocation() async {
    if (controller == null) return;

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(_context)
          .showSnackBar(SnackBar(content: Text("Aktifkan layanan lokasi!")));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(_context)
            .showSnackBar(SnackBar(content: Text("Layanan lokasi ditolak.")));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(_context).showSnackBar(
          SnackBar(content: Text("Layanan lokasi ditolak permanen.")));
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    location = LatLng(position.latitude, position.longitude);
    controller!.animateCamera(CameraUpdate.newLatLng(location));
    updateAddressBasedOnPosition();
  }

  Future updateAddressBasedOnPosition() async {
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
  }

  bool _pinEnabled = true;
  bool get pinEnabled => _pinEnabled;
  set pinEnabled(bool value) {
    _pinEnabled = value;
    notifyListeners();
  }
}
