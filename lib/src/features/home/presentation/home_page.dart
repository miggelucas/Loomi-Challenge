import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/features/featured_cards/presentation/widgets/home_main_carrousel.dart';
import 'package:loomi_challenge/src/features/tournaments/presentation/widgets/tournament_carrousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(250, 245, 206, 1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
          SafeArea(
            left: false,
            right: false,
            child: Center(
              child: ListView(
                // padding: const EdgeInsets.(16.0),
                children: [
                  Image.asset('assets/images/imperio_label.png',
                      fit: BoxFit.contain, width: 100, height: 25),
                  const SizedBox(height: 20),
                  const HomeCardCarousel(),
                  const SizedBox(height: 32),
                  const TournamentCarrousel(),
                  // Add other elements like Text, Image, etc.
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
