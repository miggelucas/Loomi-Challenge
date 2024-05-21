enum HomeCardSection {
  all,
  futebol,
  basket,
  eEsports,
}

extension HomeCardSectionExtension on HomeCardSection {
  String get name {
    switch (this) {
      case HomeCardSection.all:
        return 'Todos';
      case HomeCardSection.futebol:
        return 'Futebol';
      case HomeCardSection.basket:
        return 'Basquete';
      case HomeCardSection.eEsports:
        return 'E-sports';
    }
  }

  String get imageAsset {
    switch (this) {
      case HomeCardSection.all:
        return 'assets/images/whistle_icon.png';
      case HomeCardSection.futebol:
        return 'assets/images/soccer_icon.png';
      case HomeCardSection.basket:
        return 'assets/images/basketball_icon.png';
      case HomeCardSection.eEsports:
        return 'assets/images/eesports_icon.png';
    }
  }
}
