import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/features/featured_cards/model/home_card_section.dart';

class HomeCardModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color backgroundColor;
  final HomeCardSection section;

  HomeCardModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.backgroundColor,
    required this.section,
  });
}
