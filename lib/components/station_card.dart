import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_button.dart';

class StationCard extends StatelessWidget {
  final int stationID;
  final String stationName;
  final int stationRange;
  final String stationAddress;
  final int bikesAvailable;

  const StationCard({
    Key? key,
    required this.stationID,
    required this.stationName,
    required this.stationRange,
    required this.stationAddress,
    required this.bikesAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: <Widget>[
          SvgPicture.asset('assets/svg/station_icon.svg'),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      stationName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      stationRange.toString() + "m",
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  stationAddress,
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  bikesAvailable.toString() + " Bikes available",
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black87,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: CustomButton(
                    text: "Go now",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
