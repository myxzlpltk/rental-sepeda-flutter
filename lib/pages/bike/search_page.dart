import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/station_card_horizontal.dart';
import 'package:rental_sepeda_flutter/components/text_icon.dart';
import 'package:rental_sepeda_flutter/providers/search_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(context),
      builder: (context, _) => Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _searchBox(context),
                Expanded(
                  child: Consumer<SearchProvider>(
                    builder: (context, state, _) => GoogleMap(
                      padding: state.stations.isEmpty
                          ? EdgeInsets.fromLTRB(10, 0, 0, 10)
                          : EdgeInsets.fromLTRB(10, 0, 0, 90),
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      mapToolbarEnabled: false,
                      zoomControlsEnabled: false,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      initialCameraPosition: state.initialCam,
                      onMapCreated: state.onMapCreated,
                      onCameraMove: state.onCameraMove,
                      markers: Set<Marker>.of(
                        state.stations.map(
                          (e) => Marker(
                            markerId: MarkerId(e.id),
                            position: LatLng(
                              e.geoPoint.latitude,
                              e.geoPoint.longitude,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _cardRental(context),
          ],
        ),
      ),
    );
  }

  Widget _searchBox(BuildContext context) {
    return Ink(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(gradient: customGradientBlueToGreen),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 16,
                  color: whiteColor,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Ink(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: whiteColor.withAlpha(90),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      controller:
                          Provider.of<SearchProvider>(context, listen: false)
                              .searchController,
                      style: bodyText2Style.copyWith(color: whiteColor),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration.collapsed(
                        hintText: "Ketik pencarian alamat...",
                        hintStyle: bodyText2Style.copyWith(color: whiteColor),
                      ),
                      onEditingComplete:
                          Provider.of<SearchProvider>(context, listen: false)
                              .searchAddress,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Consumer<SearchProvider>(
              builder: (context, state, _) => Row(
                children: [
                  TextIcon(
                    iconData: Icons.home,
                    text: "${state.stations.length} stasiun didekatmu",
                  ),
                  Spacer(),
                  TextIcon(
                    iconData: Icons.pin_drop_rounded,
                    text:
                        "${state.stations.isEmpty ? 0 : state.stations.map((a) => a.totalCycles).reduce((a, b) => a + b)} sepeda tersedia",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardRental(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Consumer<SearchProvider>(
        builder: (context, state, _) => state.stations.isNotEmpty
            ? StationCardHorizontal(station: state.stations.first)
            : SizedBox(),
      ),
    );
  }
}
