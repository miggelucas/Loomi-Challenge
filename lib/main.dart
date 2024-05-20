import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_card_component.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeCardComponent(
              title: "Example",
              subtitle: "Example subtitle a little bit longer",
              imageUrl: "assets/images/home_card_nba_placeholder.png",
              backgroundColor: Colors.blue),
        ),
      ),
    );
  }
}
