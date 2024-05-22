import 'package:loomi_challenge/src/features/tournaments/data/datasource/tournament_remote_datasource.dart';
import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/fetch_tournaments.dart';

class TournamentRepository implements TournamentRepositoryProtocol {
  final TournamentDataSourceProtocol remoteDatasource =
      TournamentRemoteDataSource();

  @override
  Future<List<TournamentModel>> fetchTournaments() async {
    return await remoteDatasource.fetchTournaments();
  }
}
