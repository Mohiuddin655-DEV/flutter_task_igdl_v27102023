import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class AuthTextField extends StatelessWidget {
  final EditTextController? controller;
  final String hint;
  final String? text;
  final TextInputType? inputType;

  const AuthTextField({
    super.key,
    this.controller,
    required this.hint,
    this.text,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return EditText(
      inputType: inputType,
      marginBottom: 24,
      controller: controller,
      hint:hint,
      text: text,
    );
  }
}
