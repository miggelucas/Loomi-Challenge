class TournamentModel {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;

  TournamentModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });

  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
