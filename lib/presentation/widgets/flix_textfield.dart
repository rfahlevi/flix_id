// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

class FlixTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  const FlixTextfield({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: ghostWhite),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: ghostWhite),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ghostWhite),
          )),
    );
  }
}
