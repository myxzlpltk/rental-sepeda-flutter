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
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;

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
    this.autofillHints,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        isDense: true,
        suffixIconConstraints: BoxConstraints(
          minWidth: 50,
          minHeight: 32,
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
      autofillHints: autofillHints,
      validator: validator,
    );
  }
}

class CustomTextFormField2 extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String initialValue;
  final bool obscureText;
  final bool enabled;
  const CustomTextFormField2({
    Key? key,
    this.hintText = "",
    this.labelText = "",
    this.initialValue = "",
    this.obscureText = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        enabled: enabled,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
