import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tips/domain/repository/tip_repository_protocol.dart';
import 'package:loomi_challenge/src/features/tips/presentation/model/tip_card_model.dart';

class FetchTipsCards {
  final TipRepositoryProtocol repository;

  FetchTipsCards({required this.repository});

  Future<Either<Failure, List<TipCardModel>>> call() async {
    final result = await repository.fetchTips();

    return result.fold(
        (failure) => Left(failure),
        (tips) => Right(tips
            .map((tip) => TipCardModel(
                  id: tip.id,
                  title: tip.title,
                  description: tip.description,
                  imageUrl: tip.imageUrl,
                ))
            .toList()));
  }
}
