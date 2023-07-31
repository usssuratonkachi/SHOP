
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key? key,
    required this.code,
  }) : super(key: key);

  final String? code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: HexColor('$code'),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black)),
    );
  }
}