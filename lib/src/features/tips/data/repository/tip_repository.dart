import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/exception.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tips/data/Model/tip_model.dart';
import 'package:loomi_challenge/src/features/tips/domain/repository/tip_repository_protocol.dart';

abstract class TipDataSourceProtocol {
  Future<List<TipModel>> fetchTips();
}

class TipRepository implements TipRepositoryProtocol {
  final TipDataSourceProtocol dataSource;

  TipRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<TipModel>>> fetchTips() async {
    try {
      final result = await dataSource.fetchTips();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
