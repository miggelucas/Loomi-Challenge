part of 'tip_bloc.dart';

sealed class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

class TipLoading extends TipState {}

class TipError extends TipState {}

class TipContent extends TipState {
  final List<TipCardModel> tips;

  const TipContent(this.tips);

  @override
  List<Object> get props => [tips];
}
