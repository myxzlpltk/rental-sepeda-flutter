import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/routes.dart';

import 'custom_button.dart';

class StationCard extends StatelessWidget {
  final String stationAddress;
  final String stationName;
  final int bikesAvailable;
  final int stationID;
  final int stationRange;

  const StationCard({
    Key? key,
    required this.bikesAvailable,
    required this.stationAddress,
    required this.stationID,
    required this.stationName,
    required this.stationRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          child: Image(
            height: 73,
            width: 120,
            image: AssetImage('assets/image/card_banner.png'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: 120,
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
                    "${stationRange}m",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                stationAddress,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                bikesAvailable.toString() + " Bikes available",
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: CustomButton(
                  text: "Go now",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.station,
                      arguments: {'id': stationID},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
