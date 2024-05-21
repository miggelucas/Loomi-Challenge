import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/widgets/home_main_carrousel.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/tournaments_carrousel/model/tournament_card_model.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/tournaments_carrousel/widgets/tournament_carrousel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Home View')),
            body: TournamentCarrousel()));
  }
}
