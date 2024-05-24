import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';
import 'package:loomi_challenge/src/core/utils/service_locator.dart';
import 'package:loomi_challenge/src/features/tips/presentation/bloc/tip_bloc.dart';
import 'package:loomi_challenge/src/features/tips/presentation/model/tip_card_model.dart';
import 'package:loomi_challenge/src/features/tips/presentation/widgets/tip_card_component.dart';

class TipCarousel extends StatefulWidget {
  const TipCarousel({super.key});

  @override
  State<TipCarousel> createState() => _TipCarouselState();
}

class _TipCarouselState extends State<TipCarousel> {
  late TipBloc _tipBloc;

  @override
  void initState() {
    super.initState();
    _tipBloc = getIt<TipBloc>();
    _tipBloc.add(FetchTipsEvent());
  }

  @override
  void dispose() {
    _tipBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _tipBloc,
      child: BlocBuilder<TipBloc, TipState>(
        builder: (context, state) {
          if (state is TipLoading) {
            return const Center(
              child: TipCarroulseLoading(),
            );
          } else if (state is TipContent) {
            return TipCarouselContent(tips: state.tips);
          } else {
            return const Center(
              child: Text("Erro ao carregar dicas"),
            );
          }
        },
      ),
    );
  }
}

class TipCarouselContent extends StatelessWidget {
  final List<TipCardModel> tips;

  const TipCarouselContent({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dicas",
                  style: CustomTextSyle.headline4,
                ),
                const Spacer(),
                Text(
                  "Ver todas",
                  style: CustomTextSyle.action2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: TipCardComponent.heitgh,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: () {
                    if (index == 0) {
                      return const EdgeInsets.only(left: 24, right: 6);
                    } else if (index == tips.length - 1) {
                      return const EdgeInsets.only(left: 6, right: 24);
                    } else {
                      return const EdgeInsets.symmetric(horizontal: 6);
                    }
                  }(),
                  child: TipCardComponent(model: tips[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TipCarroulseLoading extends StatelessWidget {
  const TipCarroulseLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dicas",
                  style: CustomTextSyle.headline4,
                ),
                const Spacer(),
                Text(
                  "Ver todas",
                  style: CustomTextSyle.action2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: TipCardComponent.heitgh,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
