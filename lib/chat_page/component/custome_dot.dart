import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({
    super.key,
    this.height = 12.0,
    this.width = 12.0,
    this.color = Colors.redAccent,
  });

  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}
