import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/fetch_tournaments.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/bloc/tournament_bloc.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/widgets/tournament_card.dart';

class TournamentCarrousel extends StatefulWidget {
  const TournamentCarrousel({super.key});

  @override
  _TournamentCarrouselState createState() => _TournamentCarrouselState();
}

class _TournamentCarrouselState extends State<TournamentCarrousel> {
  late TournamentBloc _tournamentBloc;

  @override
  void initState() {
    super.initState();
    _tournamentBloc = TournamentBloc(fetchTournamentCards: FetchTournament());
    _tournamentBloc.add(TournamentFetch());
  }

  @override
  void dispose() {
    _tournamentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _tournamentBloc,
      child: BlocBuilder<TournamentBloc, TournamentState>(
        builder: (context, state) {
          if (state is TournamentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TournamentContent) {
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
                    children: state.tournaments.map((model) {
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
          } else if (state is TournamentError) {
            return const Center(
              child: Text("Erro ao carregar os campeonatos"),
            );
          } else {
            return const Center(
              child: Text("Estado desconhecido"),
            );
          }
        },
      ),
    );
  }
}
