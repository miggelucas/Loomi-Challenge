class TournamentCardModel {
  final String id;
  final String imageUrl;

  const TournamentCardModel({
    required this.id,
    required this.imageUrl,
  });
}

extension TournamentCardModelExtension on TournamentCardModel {
  static TournamentCardModel get sample => const TournamentCardModel(
      id: '1',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/leaguelogos/soccer/500/2.png');
}
