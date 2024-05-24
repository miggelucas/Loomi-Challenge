import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/features/tips/presentation/model/tip_card_model.dart';
import 'package:loomi_challenge/src/features/tips/presentation/widgets/tip_card_component.dart';

class TipCarroulsel extends StatelessWidget {
  final List<TipCardModel> tips = [
    const TipCardModel(
        id: "1",
        title: "Dicas para uma boa noite de sono",
        description:
            "Dormir bem é essencial para a saúde do corpo e da mente. Veja algumas dicas para ter uma boa noite de sono.",
        imageUrl: "https://images.unsplash.com/photo-1612838320302-4"),
    const TipCardModel(
        id: "1",
        title: "Dicas para uma boa noite de sono",
        description:
            "Dormir bem é essencial para a saúde do corpo e da mente. Veja algumas dicas para ter uma boa noite de sono.",
        imageUrl: "https://images.unsplash.com/photo-1612838320302-4"),
    const TipCardModel(
        id: "1",
        title: "Dicas para uma boa noite de sono",
        description:
            "Dormir bem é essencial para a saúde do corpo e da mente. Veja algumas dicas para ter uma boa noite de sono.",
        imageUrl: "https://images.unsplash.com/photo-1612838320302-4"),
    const TipCardModel(
        id: "1",
        title: "Dicas para uma boa noite de sono",
        description:
            "Dormir bem é essencial para a saúde do corpo e da mente. Veja algumas dicas para ter uma boa noite de sono.",
        imageUrl: "https://images.unsplash.com/photo-1612838320302-4"),
  ];

  TipCarroulsel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dicas",
                    style: CustomTextSyle.headline4,
                  ),
                  const Spacer(),
                  Text(
                    "Ver todas",
                    style: CustomTextSyle.action2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: TipCardComponent.heitgh,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: () {
                      if (index == 0) {
                        return const EdgeInsets.only(left: 24, right: 6);
                      } else if (index == tips.length - 1) {
                        return const EdgeInsets.only(left: 6, right: 24);
                      } else {
                        return const EdgeInsets.symmetric(horizontal: 6);
                      }
                    }(),
                    child: TipCardComponent(model: tips[index]),
                  );
                },
              ),
            )
          ]),
    );
  }
}
