import 'dart:core';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final String inputType; //Input Types = {none, email, password, num}
  final bool isRequired;
  final function;
  final String? labelText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final InputDecoration? inputDecoration;
  final int? maxLength;

  const FormTextField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.inputType,
      required this.isRequired,
      this.function,
      this.labelText,
      this.prefixIcon,
      this.focusNode,
      this.onFieldSubmitted,
      this.inputDecoration,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText!,
        maxLength: maxLength,
        keyboardType: inputType.isNotEmpty && inputType == "num"
            ? TextInputType.number
            : null,
        inputFormatters: inputType.isNotEmpty && inputType == "num"
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9.-]+')),
              ]
            : null,
        decoration: inputDecoration ??
            InputDecoration(
              enabledBorder: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1.0),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              isDense: true,
              prefixIcon: prefixIcon,
              fillColor: Colors.grey[10],
              filled: true,
              labelText: labelText,
              counterText: '',
              errorBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.0),
              ),
            ),

        // ignore: missing_return
        validator: (v) {
          //Required
          if (isRequired == true) {
            if (v!.isEmpty) {
              return 'Required Field';
            }
          }
          return null;
        },
      ),
    );
  }
}

