import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/usecases/fetch_tournaments.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/model/tournament_card_model.dart';

part 'tournament_event.dart';
part 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  final FetchTournamentProtocol fetchTournamentCards;

  TournamentBloc({required this.fetchTournamentCards})
      : super(TournamentLoading()) {
    on<TournamentFetchEvent>(_onTournamentFetch);
  }

  Future<void> _onTournamentFetch(
      TournamentFetchEvent event, Emitter<TournamentState> emit) async {
    emit(TournamentLoading());

    final result = await fetchTournamentCards();

    result.fold(
      (failure) => emit(TournamentError()),
      (tournaments) => emit(TournamentContent(tournaments)),
    );
  }
}
