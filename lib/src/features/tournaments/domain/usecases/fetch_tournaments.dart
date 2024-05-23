import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/repositories/tournament_repository_protocol.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/model/tournament_card_model.dart';

abstract class FetchTournamentProtocol {
  Future<Either<Failure, List<TournamentCardModel>>> call();
}

class FetchTournament implements FetchTournamentProtocol {
  final TournamentRepositoryProtocol repository;

  FetchTournament({required this.repository});

  @override
  Future<Either<Failure, List<TournamentCardModel>>> call() async {
    final result = await repository.fetchTournaments();

    return result.fold(
      (failure) => Left(failure),
      (tournaments) => Right(tournaments
          .map((model) =>
              TournamentCardModel(id: model.id, imageUrl: model.image))
          .toList()),
    );
  }
}
