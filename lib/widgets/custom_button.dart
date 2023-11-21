import 'package:flutter/material.dart';
import 'package:zoom/utilits/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String message;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomButton(
      {super.key,
      required this.message,
      required this.onPressed,
      this.fontSize,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    CustomColors colors = CustomColors();
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: colors.buttonColor,
          minimumSize: const Size(double.infinity, 50),
          side: const BorderSide(color: Colors.white)),
      child: Text(
        message,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: Colors.white),
      ),
    );
  }
}
