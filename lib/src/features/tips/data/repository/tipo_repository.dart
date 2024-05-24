class TipoRepository implements TipoRepositoryProtocol {
  final TipoDataSourceProtocol dataSource;

  TipoRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<TipoModel>>> fetchTipos() async {
    try {
      final result = await dataSource.fetchTipos();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
