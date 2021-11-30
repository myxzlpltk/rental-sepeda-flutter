import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/commons/utils.dart';

class AmountCard extends StatelessWidget {
  final bool isSelected;
  final int amount;
  final void Function()? onTap;

  const AmountCard({
    Key? key,
    required this.amount,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: (MediaQuery.of(context).size.width - 60) / 3,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26),
          color: isSelected ? blueColor.withOpacity(0.25) : whiteColor,
        ),
        child: Text(
          toIDR(amount),
          style: bodyText2Style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
