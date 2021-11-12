import 'package:flutter/material.dart';
import '../commons/constants.dart';

class BottomAppItem extends StatefulWidget {
  final Function callback;
  final Widget screen;
  final int tab;
  final int currentTab;
  final IconData icon;
  const BottomAppItem({
    Key? key,
    required this.callback,
    required this.screen,
    required this.tab,
    required this.currentTab,
    required this.icon,
  }) : super(key: key);

  @override
  _BottomAppItemState createState() => _BottomAppItemState();
}

class _BottomAppItemState extends State<BottomAppItem> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        widget.callback(widget.tab, widget.screen);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color:
                widget.currentTab == widget.tab ? Colors.black : Colors.black38,
          ),
        ],
      ),
    );
  }
}
