import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class AffliationWidget extends StatelessWidget {
  const AffliationWidget({
    super.key,
    this.text1='',
    this.text2='',
    required this.image,
    this.isNetworkImage = false,
  });

  final String text1;
  final String text2;
  final String image;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text1,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        WidgetMask(
          childSaveLayer: true,
          blendMode: BlendMode.srcATop,
          mask: isNetworkImage
              ? Image.network(
            image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          )
              : Image.asset(
            image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          child: Image.asset(
            'assets/Deformed Circle.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        Text(text2,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      ],
    );
  }
}
