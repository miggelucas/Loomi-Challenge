import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/extensions/colors.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/model/tournament_card_model.dart';

class TournamentCard extends StatelessWidget {
  final TournamentCardModel tournamentCard;

  const TournamentCard({
    super.key,
    required this.tournamentCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: CustomColors.imperioYellow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: tournamentCard.imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
