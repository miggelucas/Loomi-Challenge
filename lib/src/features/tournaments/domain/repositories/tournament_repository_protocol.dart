import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';

abstract class TournamentRepositoryProtocol {
  Future<Either<Failure, List<TournamentModel>>> fetchTournaments();
}
