class TipModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  const TipModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) {
    return TipModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image'],
    );
  }
}
