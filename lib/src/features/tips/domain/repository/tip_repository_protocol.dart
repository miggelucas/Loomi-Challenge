import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tips/data/Model/tip_model.dart';

abstract class TipRepositoryProtocol {
  Future<Either<Failure, List<TipModel>>> fetchTips();
}
