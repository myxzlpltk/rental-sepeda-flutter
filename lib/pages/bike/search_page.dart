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
                  child: Stack(
                    children: [
                      Consumer<SearchProvider>(
                        builder: (context, state, _) => GoogleMap(
                          mapType: MapType.normal,
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
                                onTap: () {
                                  Future.delayed(Duration(seconds: 1), () {
                                    state.pinEnabled = false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Consumer<SearchProvider>(
                          builder: (context, state, _) => state.pinEnabled
                              ? Icon(
                                  Icons.location_on,
                                  color: Colors.red.shade500,
                                )
                              : SizedBox(),
                        ),
                      ),
                    ],
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
                              .search,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: const [
                TextIcon(
                  iconData: Icons.home,
                  text: "10 rental didekatmu",
                ),
                Spacer(),
                TextIcon(
                  iconData: Icons.pin_drop_rounded,
                  text: "10 sepeda tersedia",
                ),
              ],
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
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              mini: true,
              child: Icon(Icons.my_location, size: 20),
              onPressed: Provider.of<SearchProvider>(context, listen: false)
                  .toCurrentLocation,
            ),
          ),
          Consumer<SearchProvider>(
            builder: (context, state, _) =>
                state.stations.isNotEmpty ? SizedBox(height: 16) : SizedBox(),
          ),
          Consumer<SearchProvider>(
            builder: (context, state, _) => state.stations.isNotEmpty
                ? StationCardHorizontal(station: state.stations.first)
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
