import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MButtonTwoSideRounded extends StatelessWidget {
  const MButtonTwoSideRounded({
    super.key,
    required this.text,
    this.radius = 29,
    required this.press,
  });
  final String text;
  final double radius;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: ColorTheme.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: ColorTheme.mainLightColor),
        ),
      ),
    );
  }
}
