import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';

class HomeCardComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color backgroundColor;

  const HomeCardComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.backgroundColor,
  });

  static const double width = 270;
  static const double height = 166;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        children: [
          OverflowBox(
            maxHeight: height + 20,
            maxWidth: width * 0.9,
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomRight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33, left: 21),
            child: FractionallySizedBox(
              widthFactor: 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextSyle.headline4,
                  ),
                  const SizedBox(height: 4.0),
                  Text(subtitle, style: CustomTextSyle.caption2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
