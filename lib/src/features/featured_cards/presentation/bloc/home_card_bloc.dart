import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loomi_challenge/src/core/extensions/colors.dart';
import 'package:loomi_challenge/src/features/featured_cards/model/home_card_model.dart';
import 'package:loomi_challenge/src/features/featured_cards/model/home_card_section.dart';

part 'home_card_event.dart';
part 'home_card_state.dart';

class HomeCardBloc extends Bloc<HomeCardEvent, HomeCardState> {
  final List<HomeCardModel> allCards = [
    HomeCardModel(
      title: 'Campeonatos populares',
      subtitle: '',
      imageUrl: 'assets/images/home_card_popular_tournaments.png',
      backgroundColor: HexColor.fromHex('#F5D70A'),
      section: HomeCardSection.futebol,
    ),
    HomeCardModel(
      title: 'NBA',
      subtitle: 'Nation Basketball Association',
      imageUrl: 'assets/images/home_card_nba_placeholder.png',
      backgroundColor: HexColor.fromHex("#C0C4C2"),
      section: HomeCardSection.basket,
    ),
    HomeCardModel(
      title: 'League of Legends',
      subtitle: '',
      imageUrl: 'assets/images/home_card_league_of_legends.png',
      backgroundColor: CustomColors.imperioYellow,
      section: HomeCardSection.eEsports,
    ),
  ];

  HomeCardBloc() : super(const HomeCardState(HomeCardSection.all, [])) {
    on<SelectSectionEvent>((event, emit) {
      final filteredCards = event.section == HomeCardSection.all
          ? allCards
          : allCards.where((card) => card.section == event.section).toList();

      emit(HomeCardState(event.section, filteredCards));
    });

    add(SelectSectionEvent(HomeCardSection.all));
  }
}
