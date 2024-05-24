import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tournaments/data/datasource/tournament_remote_datasource.dart';
import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';
import 'package:loomi_challenge/src/features/tournaments/data/repository/tournament_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockTournamentsRemoteDataSource extends Mock
    implements TournamentDataSourceProtocol {}

void main() {
  late MockTournamentsRemoteDataSource remoteDataSource;
  late TournamentRepository repository;

  setUp(() {
    remoteDataSource = MockTournamentsRemoteDataSource();
    repository = TournamentRepository(remoteDatasource: remoteDataSource);
  });

  test('should call fetchTournaments from the remote datasource', () async {
    // arrange
    when(() => remoteDataSource.fetchTournaments()).thenAnswer((_) async => []);
    // act
    await repository.fetchTournaments();
    // assert
    verify(() => remoteDataSource.fetchTournaments());
  });

  test(
      'should return a Right list of TournamentModel if remote datasource call is successful',
      () async {
    // arrange
    final List<TournamentModel> tournaments = [
      TournamentModel.optional(id: '1', image: 'image1'),
      TournamentModel.optional(id: '2', image: 'image2'),
    ];
    when(() => remoteDataSource.fetchTournaments())
        .thenAnswer((_) async => tournaments);
    // act
    final result = await repository.fetchTournaments();
    // assert
    expect(result.isRight(), true);
    expect(result, equals(Right(tournaments)));
  });

  test(
      'should return a Left ServerFailure if remote datasource call is unsuccessful',
      () async {
    // arrange
    when(() => remoteDataSource.fetchTournaments())
        .thenAnswer((_) async => throw ServerFailure());
    // act
    final result = await repository.fetchTournaments();
    // assert

    expect(result.isLeft(), true);
    expect(result, Left(ServerFailure()));
  });
}
