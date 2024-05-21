import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/bloc/home_card_bloc.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/model/home_card_section.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/widgets/home_card_component.dart';

class HomeCardCarousel extends StatelessWidget {
  const HomeCardCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCardBloc(),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: HomeCardSection.values.map((section) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(section.name),
                    selected:
                        context.watch<HomeCardBloc>().state.selectedSection ==
                            section,
                    onSelected: (selected) {
                      if (selected) {
                        context
                            .read<HomeCardBloc>()
                            .add(SelectSectionEvent(section));
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: HomeCardComponent.height,
            clipBehavior: Clip.none,
            child: BlocBuilder<HomeCardBloc, HomeCardState>(
              builder: (context, state) {
                return ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.cards
                        .map((card) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: HomeCardComponent(card: card),
                            ))
                        .toList());
              },
            ),
          ),
        ],
      ),
    );
  }
}
