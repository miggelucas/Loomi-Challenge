import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tournaments/data/datasource/tournament_remote_datasource.dart';
import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/repositories/tournament_repository_protocol.dart';
import 'package:dartz/dartz.dart';

class TournamentRepository implements TournamentRepositoryProtocol {
  final TournamentDataSourceProtocol remoteDatasource;

  TournamentRepository({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<TournamentModel>>> fetchTournaments() async {
    try {
      final tournaments = await remoteDatasource.fetchTournaments();
      return Right(tournaments);
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}
