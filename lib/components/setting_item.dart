import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final void Function()? onPressed;

  const SettingItem({
    Key? key,
    required this.text,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black54),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 4),
          primary: Colors.black54,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(iconData),
            SizedBox(width: 8),
            Text(text),
            Spacer(),
            Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
