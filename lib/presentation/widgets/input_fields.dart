import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      this.labelText,
      this.controller,
      this.width,
      this.textInputType});

  final String? labelText;
  final TextEditingController? controller;
  final double? width;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          labelText: labelText ?? '',
          labelStyle: const TextStyle(color: Colors.black),
          contentPadding: const EdgeInsets.only(left: 15),
        ),
      ),
    );
  }
}
