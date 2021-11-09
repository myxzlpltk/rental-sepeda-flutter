import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Icon? suffixIcon;

  const CustomTextFormField({
    Key? key,
    this.hintText = "",
    this.labelText = "",
    this.suffixIcon = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.only(left: 20),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              )),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
