import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/model/home_card_model.dart';

class HomeCardComponent extends StatelessWidget {
  final HomeCardModel card;

  const HomeCardComponent({
    super.key,
    required this.card,
  });

  static const double width = 270;
  static const double height = 166;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: card.backgroundColor,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          OverflowBox(
            maxHeight: height + 20,
            maxWidth: width * 0.9,
            alignment: Alignment.bottomRight,
            child: Image.asset(
              card.imageUrl,
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
                    card.title,
                    style: CustomTextSyle.headline4,
                  ),
                  const SizedBox(height: 4.0),
                  Text(card.subtitle, style: CustomTextSyle.caption2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
