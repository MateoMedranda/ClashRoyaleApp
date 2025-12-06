import '../../domain/entities/clan.dart';

class ClanModel extends ClanEntity {
	ClanModel({
		required String tag,
		required String name,
		required String type,
		required int badgeId,
		required int clanScore,
		required int clanWarTrophies,
		Map<String, dynamic>? location,
		required int requiredTrophies,
		required int donationsPerWeek,
		required int clanChestLevel,
		required int clanChestMaxLevel,
		required int members,
	}) : super(
					tag: tag,
					name: name,
					type: type,
					badgeId: badgeId,
					clanScore: clanScore,
					clanWarTrophies: clanWarTrophies,
					location: location,
					requiredTrophies: requiredTrophies,
					donationsPerWeek: donationsPerWeek,
					clanChestLevel: clanChestLevel,
					clanChestMaxLevel: clanChestMaxLevel,
					members: members,
				);

	factory ClanModel.fromJson(Map<String, dynamic> json) {
		return ClanModel(
			tag: json['tag'] ?? '',
			name: json['name'] ?? 'Sin nombre',
			type: json['type'] ?? '',
			badgeId: json['badgeId'] ?? 0,
			clanScore: json['clanScore'] ?? 0,
			clanWarTrophies: json['clanWarTrophies'] ?? 0,
			location: json['location'],
			requiredTrophies: json['requiredTrophies'] ?? 0,
			donationsPerWeek: json['donationsPerWeek'] ?? 0,
			clanChestLevel: json['clanChestLevel'] ?? 0,
			clanChestMaxLevel: json['clanChestMaxLevel'] ?? 0,
			members: json['members'] ?? 0,
		);
	}
}
