part of 'tournament_bloc.dart';

sealed class TournamentState extends Equatable {
  const TournamentState();

  @override
  List<Object> get props => [];
}

final class TournamentLoading extends TournamentState {}

class TournamentError extends TournamentState {}

final class TournamentContent extends TournamentState {
  final List<TournamentCardModel> tournaments;

  const TournamentContent(this.tournaments);

  @override
  List<Object> get props => [tournaments];
}
