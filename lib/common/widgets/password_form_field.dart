// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:dropill_project/common/widgets/custom_text_fiel.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      labelText: widget.labelText,
      hintText: widget.hintText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23.0),
          onTap: () {
          log("pressed");
          setState(() {
            isHidden = !isHidden;

          });
        },
        child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
