import 'package:dartz/dartz.dart';
import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tips/presentation/model/tip_card_model.dart';
import 'package:loomi_challenge/src/features/tips/presentation/widgets/tip_card_component.dart';

abstract class TipRepositoryProtocol {
  Future<Either<ServerFailure, List<TipModel>>> fetchTips();
}

class TipModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  const TipModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class FetchTips {
  final TipRepositoryProtocol repository;

  FetchTips({required this.repository});

  Future<Either<ServerFailure, List<TipCardModel>>> call() async {
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
