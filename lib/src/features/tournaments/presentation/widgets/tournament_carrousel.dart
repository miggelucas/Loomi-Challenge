import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/widgets/tournament_card.dart';

class TournamentCarrousel extends StatelessWidget {
  final List tournamentModels = [];

  TournamentCarrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Campeonatos populares",
          style: CustomTextSyle.headline4,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: tournamentModels.map((model) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TournamentCard(
                  tournamentCard: model,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
