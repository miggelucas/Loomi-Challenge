import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/bloc/home_card_bloc.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/model/home_card_section.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/widgets/home_card_component.dart';

class HomeCardCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeCardBloc(),
        child: Column(
          children: [
            HomeCardSectionList(),
            HomeCardList(),
          ],
        ));
  }
}

class HomeCardSectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCardBloc, HomeCardState>(builder: (context, state) {
      return Container(
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: HomeCardSection.values.map((section) {
              final bool isSelected = state.selectedSection == section;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        section.imageAsset,
                        color: isSelected ? Colors.black : Colors.grey,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        section.name,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    context
                        .read<HomeCardBloc>()
                        .add(SelectSectionEvent(section));
                  },
                ),
              );
            }).toList(),
          ));
    });
  }
}

class HomeCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCardBloc, HomeCardState>(
      builder: (context, state) {
        print('State updated: ${state.selectedSection}');
        return Container(
          height: HomeCardComponent.height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: state.cards.map((card) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: HomeCardComponent(card: card),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
