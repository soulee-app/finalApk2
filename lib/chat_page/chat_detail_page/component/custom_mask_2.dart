import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class CustomMask2 extends StatelessWidget {
  const CustomMask2({
    super.key,
    required this.image1,
    required this.image2,
    this.height = 100.0,
    this.width = 100.0,
  });

  final String image1;
  final String image2;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return WidgetMask(
      childSaveLayer: true,
      blendMode: BlendMode.srcATop,
      mask: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image1,
            height: height,
            width: width,
            fit: BoxFit.cover,
            color: Colors.black,
          ),
          Image.asset(
            image2,
            height: height,
            width: width,
            fit: BoxFit.cover,
            color: Colors.black,
          )
        ],
      ),
      child: Image.asset(
        'assets/Soulee Texts/Cloud.png',
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
