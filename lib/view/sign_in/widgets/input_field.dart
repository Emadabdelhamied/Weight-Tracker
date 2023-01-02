import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.label,
    this.widget,
    this.controller,
    required this.sizeoflabel,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final Widget? widget;
  final TextEditingController? controller;
  final double sizeoflabel;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Add your weight',
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: decoration(),
        focusedBorder: decoration(),
        errorBorder: decoration(),
        errorStyle: const TextStyle(color: Colors.white),
        focusedErrorBorder: decoration(),
      ),
      cursorColor: Colors.black,
    );
  }
}

OutlineInputBorder decoration() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    );
