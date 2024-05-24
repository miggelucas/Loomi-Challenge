import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/utils/service_locator.dart';
import 'package:loomi_challenge/src/features/home/presentation/home_page.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
