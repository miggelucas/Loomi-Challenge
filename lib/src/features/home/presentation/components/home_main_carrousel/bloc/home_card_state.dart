part of 'home_card_bloc.dart';

class HomeCardState extends Equatable {
  final HomeCardSection selectedSection;
  final List<HomeCardModel> cards;

  const HomeCardState(this.selectedSection, this.cards);

  @override
  List<Object> get props => [];
}

final class HomeCardInitial extends HomeCardState {
  HomeCardInitial(super.selectedSection, super.cards);
}
