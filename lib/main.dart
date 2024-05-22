import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/widgets/tournament_carrousel.dart';

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
