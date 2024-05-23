import 'package:get_it/get_it.dart';
import 'package:loomi_challenge/src/features/tournaments/data/datasource/tournament_remote_datasource.dart';
import 'package:loomi_challenge/src/features/tournaments/data/repository/tournament_repository.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/repositories/tournament_repository_protocol.dart';
import 'package:loomi_challenge/src/features/tournaments/domain/usecases/fetch_tournaments.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/bloc/tournament_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // feature Tournament
  getIt.registerLazySingleton<TournamentDataSourceProtocol>(
      () => TournamentRemoteDataSource());

  getIt.registerLazySingleton<TournamentRepositoryProtocol>(() =>
      TournamentRepository(
          remoteDatasource: getIt<TournamentDataSourceProtocol>()));

  getIt.registerLazySingleton<FetchTournamentProtocol>(
      () => FetchTournament(repository: getIt<TournamentRepositoryProtocol>()));

  getIt.registerFactory<TournamentBloc>(() =>
      TournamentBloc(fetchTournamentCards: getIt<FetchTournamentProtocol>()));
}
