part of 'home_card_bloc.dart';

class HomeCardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectSectionEvent extends HomeCardEvent {
  final HomeCardSection section;

  SelectSectionEvent(this.section);

  @override
  List<Object> get props => [section];
}
