import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class UndefinedPage extends StatelessWidget {
  final String name;

  const UndefinedPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: regularTextStyle),
        leading: IconButton(
          splashRadius: 24,
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text("Halaman tidak ditemukan"),
      ),
    );
  }
}
