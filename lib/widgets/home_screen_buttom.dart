import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom/utilits/colors.dart';

class HomeScreenCustomButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String text;

  const HomeScreenCustomButton(
      {super.key, required this.onTap, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    CustomColors colors = CustomColors();
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colors.buttonColor,
                boxShadow: const [
                  BoxShadow(
                      color: CupertinoColors.darkBackgroundGray,
                      blurRadius: 3,
                      spreadRadius: .1,
                      offset: Offset(0, 1))
                ]),
            child: Icon(
              icon,
              color: CupertinoColors.white,
              size: 30,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
