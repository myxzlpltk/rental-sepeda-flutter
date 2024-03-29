import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final Iterable<String>? autofillHints;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;

  // Focus nodes are necessary
  const CustomTextFormField({
    Key? key,
    this.autofillHints,
    this.controller,
    this.hintText = "",
    this.keyboardType,
    this.labelText = "",
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.textInputAction,
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
      onChanged: onChanged,
    );
  }
}

class CustomTextFormField2 extends StatelessWidget {
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomTextFormField2({
    Key? key,
    this.controller,
    this.enabled = true,
    this.focusNode,
    this.hintText = "",
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.labelText = "",
    this.obscureText = false,
    this.onChanged,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        enabled: enabled,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
      ),
    );
  }
}
