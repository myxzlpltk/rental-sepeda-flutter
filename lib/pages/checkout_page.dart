import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTemplate(
        title: "Checkout",
        children: [
          Row(
            children: const [
              Spacer(),
              Icon(
                Icons.share,
                size: 25,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.download,
                size: 25,
              ),
            ],
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/image/qrcode.png'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black54),
              ),
            ),
            child: Text(
              "Show this Barcode to Bike For All Rental to get access to your bike.",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Station 1's Bike",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Spacer(),
                    Text(
                      "ID #198H878K",
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "5 Hours",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black87),
                    ),
                    Spacer(),
                    Text(
                      "5 D",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black87),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Per Hour",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black87),
                    ),
                    Spacer(),
                    Text(
                      "IDR 20.000",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black87),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: Colors.black54),
                Row(
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Spacer(),
                    Text(
                      "IDR 100.000",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                SizedBox(height: 12),
                CustomButton(text: "Purchase", onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}