import 'package:flutter/material.dart';

class BottomAppItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final void Function()? onPressed;

  const BottomAppItem({
    Key? key,
    required this.icon,
    required this.isActive,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.black : Colors.black38,
          ),
        ],
      ),
    );
  }
}
