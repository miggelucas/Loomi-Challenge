import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/repositories/tournament_repository_protocol.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/usecases/fetch_tournaments.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/model/tournament_card_model.dart';
import 'package:mocktail/mocktail.dart';

class MocktournamentsRepository extends Mock
    implements TournamentRepositoryProtocol {}

void main() {
  late MocktournamentsRepository mockTournamentsRepository;
  late FetchTournament fetchTournament;

  setUp(() {
    mockTournamentsRepository = MocktournamentsRepository();
    fetchTournament = FetchTournament(repository: mockTournamentsRepository);
  });

  test('should call tournaments from the repository', () async {
    // arrange
    when(() => mockTournamentsRepository.fetchTournaments())
        .thenAnswer((_) async => const Right(<TournamentModel>[]));
    // act
    await fetchTournament();

    verify(() => mockTournamentsRepository.fetchTournaments());
  });

  test('should return a Failure if repository call is unsuccessful', () async {
    // arrange
    const String message = 'Failed to load tournaments';
    when(() => mockTournamentsRepository.fetchTournaments())
        .thenAnswer((_) async => Left(ServerFailure(message: message)));
    // act
    final result = await fetchTournament();
    // assert
    expect(result, Left(ServerFailure(message: message)));
  });

  test(
      'should return a list of TournamentCardModel if repository call is successful',
      () async {
    // arrange
    final List<TournamentModel> tournaments = [
      TournamentModel.optional(id: '1', image: 'image1'),
      TournamentModel.optional(id: '2', image: 'image2'),
    ];
    when(() => mockTournamentsRepository.fetchTournaments())
        .thenAnswer((_) async => Right(tournaments));
    // act
    final result = await fetchTournament();

    // assert
    final expectedResult = tournaments
        .map(
            (model) => TournamentCardModel(id: model.id, imageUrl: model.image))
        .toList();

    expect(result.isRight(), true);
    expect(expectedResult, equals(expectedResult));
  });
}
