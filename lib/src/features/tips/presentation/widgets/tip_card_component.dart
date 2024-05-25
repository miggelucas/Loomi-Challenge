import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/features/tips/presentation/model/tip_card_model.dart';

class TipCardComponent extends StatelessWidget {
  final TipCardModel model;

  const TipCardComponent({super.key, required this.model});

  static double heitgh = 300.0;
  static double width = 225.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TipCardComponent.width,
      height: TipCardComponent.heitgh,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                height: 141.5,
                width: TipCardComponent.width,
                fit: BoxFit.fill,
                imageUrl: model.imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: CustomTextSyle.action2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    model.description,
                    style: CustomTextSyle.body3,
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
