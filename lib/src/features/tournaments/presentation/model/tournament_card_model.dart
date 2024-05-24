import 'package:equatable/equatable.dart';

class TournamentCardModel extends Equatable {
  final String id;
  final String imageUrl;

  const TournamentCardModel({
    required this.id,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id];
}

extension TournamentCardModelExtension on TournamentCardModel {
  static TournamentCardModel get sample => const TournamentCardModel(
      id: '1',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/leaguelogos/soccer/500/2.png');
}
