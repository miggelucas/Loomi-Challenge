import 'package:loomi_challenge/src/features/tournaments/model/tournament_card_model.dart';

class FetchTournament {
  // final TournamentRepository repository;

  // FetchTournament(this.repository);
  FetchTournament();

  Future<List<TournamentCardModel>> call() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      TournamentCardModelExtension.sample,
      TournamentCardModelExtension.sample,
      TournamentCardModelExtension.sample,
      TournamentCardModelExtension.sample,
    ];
  }
}
