import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';
import 'package:loomi_challenge/src/features/tournaments/data/repository/tournament_repository.dart';
import 'package:loomi_challenge/src/features/tournaments/model/tournament_card_model.dart';

abstract class TournamentRepositoryProtocol {
  Future<List<TournamentModel>> fetchTournaments();
}

class FetchTournament {
  final TournamentRepositoryProtocol repository = TournamentRepository();

  FetchTournament();

  Future<List<TournamentCardModel>> call() async {
    final tournamentModels = await repository.fetchTournaments();

    return tournamentModels
        .map(
            (model) => TournamentCardModel(id: model.id, imageUrl: model.image))
        .toList();
  }
}
