import 'base_entity.dart';

class CardEntity extends BaseEntity {
  final int id;
  final String name;
  final int maxLevel;
  final int? maxEvolutionLevel;
  final int elixirCost;
  final List<String> images;
  final String rarity;

  CardEntity({
    required this.id,
    required this.name,
    required this.maxLevel,
    this.maxEvolutionLevel,
    required this.elixirCost,
    required this.images,
    required this.rarity,
  });
}