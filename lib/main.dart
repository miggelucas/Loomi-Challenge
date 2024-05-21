import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/bloc/home_card_bloc.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/widgets/home_card_component.dart';
import 'package:loomi_challenge/src/features/home/presentation/components/home_main_carrousel/widgets/home_main_carrousel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocProvider(
          create: (context) => HomeCardBloc(),
          child: const HomeCardCarousel(),
        ),
      ),
    );
  }
}
