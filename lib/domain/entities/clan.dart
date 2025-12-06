import 'base_entity.dart';

class ClanEntity extends BaseEntity {
  final String tag;
  final String name;
  final String type;
  final int badgeId;
  final int clanScore;
  final int clanWarTrophies;
  final Map<String, dynamic>? location;
  final int requiredTrophies;
  final int donationsPerWeek;
  final int clanChestLevel;
  final int clanChestMaxLevel;
  final int members;

  ClanEntity({
    required this.tag,
    required this.name,
    required this.type,
    required this.badgeId,
    required this.clanScore,
    required this.clanWarTrophies,
    this.location,
    required this.requiredTrophies,
    required this.donationsPerWeek,
    required this.clanChestLevel,
    required this.clanChestMaxLevel,
    required this.members,
  });
}
