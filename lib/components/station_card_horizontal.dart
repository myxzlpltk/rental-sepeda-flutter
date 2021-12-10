import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';

class StationCardHorizontal extends StatelessWidget {
  final String stationAddress;
  final String stationName;
  final int bikesAvailable;
  final int stationID;
  final int stationRange;

  const StationCardHorizontal({
    Key? key,
    required this.bikesAvailable,
    required this.stationAddress,
    required this.stationID,
    required this.stationName,
    required this.stationRange,
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
            arguments: {'id': stationID},
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              height: 60,
              width: 100,
              image: AssetImage('assets/image/card_banner.png'),
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
                        Text(
                          stationName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${stationRange}m",
                          style: captionStyle.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      stationAddress,
                      style: captionStyle,
                    ),
                    Text(
                      bikesAvailable.toString() + " Bikes available",
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
