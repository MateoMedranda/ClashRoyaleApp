import '../../domain/entities/card.dart';

class CardModel extends CardEntity {

  CardModel({
    required int id,
    required String name,
    required int maxLevel,
    int? maxEvolutionLevel,
    required int elixirCost,
    required List<String> images,
    required String rarity,
  }) : super(
    id: id,
    name: name,
    maxLevel: maxLevel,
    maxEvolutionLevel: maxEvolutionLevel,
    elixirCost: elixirCost,
    images: images,
    rarity: rarity,
  );

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "Sin nombre",
      maxLevel: json["maxLevel"] ?? 0,
      maxEvolutionLevel: json["maxEvolutionLevel"],
      elixirCost: json["elixirCost"] ?? 0,
      rarity: json["rarity"] ?? "Unknown",
      images: _parseImages(json),
    );
  }

  static List<String> _parseImages(Map<String, dynamic> json) {
    if (json['iconUrls'] != null && json['iconUrls'] is Map) {
      return List<String>.from(json['iconUrls'].values);
    }else {
      return ["https://via.placeholder.com/150"];
    }
  }
}