import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';
import 'package:rental_sepeda_flutter/models/station_model.dart';

class StationCardHorizontal extends StatelessWidget {
  final Station station;

  const StationCardHorizontal({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.hardEdge,
      elevation: 1,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.station,
            arguments: station,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              height: 70,
              width: 100,
              image: station.photoURL.isEmpty
                  ? AssetImage('assets/image/card_banner.png')
                  : NetworkImage(station.photoURL) as ImageProvider<Object>,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            station.name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          station.humanDistance,
                          style: captionStyle.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      station.address,
                      style: captionStyle,
                    ),
                    Text(
                      "Buka Jam ${station.openHour.toString().padLeft(2, "0")}:00 - ${station.closeHour.toString().padLeft(2, "0")}:00",
                      style: captionStyle,
                    ),
                    Text(
                      "${station.totalCycles} Sepeda tersedia",
                      style: captionStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
