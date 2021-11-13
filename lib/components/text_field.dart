import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;

  // Focus nodes are necessary
  const CustomTextFormField({
    Key? key,
    this.hintText = "",
    this.labelText = "",
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.only(left: 20),
          suffixIconConstraints: BoxConstraints(
            minWidth: 50,
            minHeight: 50,
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          labelText: labelText,
        ),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
      ),
    );
  }
}
