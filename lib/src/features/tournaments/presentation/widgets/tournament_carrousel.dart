import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/core/utils/service_locator.dart';
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
    _tournamentBloc = getIt<TournamentBloc>();
    _tournamentBloc.add(TournamentFetchEvent());
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
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    "Campeonatos populares",
                    style: CustomTextSyle.headline4,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tournaments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: () {
                          if (index == 0) {
                            return const EdgeInsets.only(left: 16, right: 4);
                          } else if (index == state.tournaments.length - 1) {
                            return const EdgeInsets.only(left: 4, right: 16);
                          } else {
                            return const EdgeInsets.symmetric(horizontal: 4);
                          }
                        }(),
                        child: TournamentCard(
                          tournamentCard: state.tournaments[index],
                        ),
                      );
                    },
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
