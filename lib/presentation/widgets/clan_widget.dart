import 'package:flutter/material.dart';
import '../../domain/entities/clan.dart';

class ClanWidget extends StatelessWidget {
  final ClanEntity clan;

  const ClanWidget({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int colorSeed = clan.badgeId;
    final int raw = (colorSeed * 9973) & 0x00FFFFFF;
    final Color baseColor = Color(0xFF000000 | raw);

    return SizedBox(
      height: 110,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: baseColor,
                child: const Text('🎯', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(clan.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(clan.tag, style: const TextStyle(color: Colors.black54, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(
                      clan.location != null && clan.location!['name'] != null
                          ? clan.location!['name']
                          : 'Sin ubicación',
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${clan.members}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Pts ${clan.clanScore}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
