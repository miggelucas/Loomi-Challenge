import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/model/home_card_model.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/model/home_card_section.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/widgets/home_card_component.dart';

part 'home_card_event.dart';
part 'home_card_state.dart';

class HomeCardBloc extends Bloc<HomeCardEvent, HomeCardState> {
  final List<HomeCardModel> allCards = [
    HomeCardModel(
      title: 'Card 1',
      subtitle: 'Subtitle 1',
      imageUrl: 'assets/images/home_card_nba_placeholder.png',
      backgroundColor: Colors.blue,
      section: HomeCardSection.futebol,
    ),
    HomeCardModel(
      title: 'Card 2',
      subtitle: 'Subtitle 2',
      imageUrl: 'assets/images/home_card_nba_placeholder.png',
      backgroundColor: Colors.red,
      section: HomeCardSection.basket,
    ),
    HomeCardModel(
      title: 'Card 3',
      subtitle: 'Subtitle 3',
      imageUrl: 'assets/images/home_card_nba_placeholder.png',
      backgroundColor: Colors.green,
      section: HomeCardSection.eEsports,
    ),
    HomeCardModel(
      title: 'Card 4',
      subtitle: 'Subtitle 4',
      imageUrl: 'assets/images/home_card_nba_placeholder.png',
      backgroundColor: Colors.orange,
      section: HomeCardSection.futebol,
    ),
  ];

  HomeCardBloc() : super(HomeCardState(HomeCardSection.all, [])) {
    on<SelectSectionEvent>((event, emit) {
      final filteredCards = event.section == HomeCardSection.all
          ? allCards
          : allCards.where((card) => card.section == event.section).toList();
      emit(HomeCardState(event.section, filteredCards));
    });

    add(SelectSectionEvent(HomeCardSection.all));
  }
}
