import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/fetchTournaments.dart';

part 'tournament_event.dart';
part 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  final FetchTournament fetchTournamentCards;

  TournamentBloc({required this.fetchTournamentCards})
      : super(TournamentInitial());

  @override
  Stream<TournamentState> mapEventToState(TournamentEvent event) async* {
    // if (event is FetchTournaments) {
    //   yield TournamentLoading();
    //   try {
    //     final tournaments = await fetchTournamentCards();
    //     yield TournamentLoaded(tournaments);
    //   } catch (e) {
    //     yield TournamentError('Failed to fetch tournaments');
    //   }
    // }
  }
}
