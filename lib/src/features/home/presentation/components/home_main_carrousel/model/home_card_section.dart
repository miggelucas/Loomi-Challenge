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
}
