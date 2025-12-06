import 'package:flutter/material.dart';
import '../../domain/entities/clan.dart';

class ClanWidget extends StatelessWidget {
  final ClanEntity clan;

  const ClanWidget({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int colorSeed = clan.badgeId;
    final int raw = (colorSeed * 9973) & 0x00FFFFFF;
    final Color headerColor = Color(0xFF000000 | raw).withOpacity(1.0);
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double h = constraints.maxHeight.isFinite && constraints.maxHeight > 0
              ? constraints.maxHeight
              : 180.0; // fallback
          final double headerH = (h * 0.28).clamp(48.0, 80.0);
          final double bodyH = h - headerH;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: headerH,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [headerColor, headerColor.withOpacity(0.85)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: const Icon(Icons.shield, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              clan.name,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              clan.tag,
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${clan.members} 🎯',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: bodyH,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: headerColor),
                          const SizedBox(width: 6),
                          Text('Puntaje: ${clan.clanScore}'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.flag, size: 16, color: Colors.grey[700]),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              clan.location != null && clan.location!['name'] != null
                                  ? clan.location!['name']
                                  : 'Sin ubicación',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          Chip(
                            label: Text(clan.type),
                            backgroundColor: headerColor.withOpacity(0.12),
                          ),
                          Chip(
                            label: Text('Chest Lv ${clan.clanChestLevel}'),
                            backgroundColor: headerColor.withOpacity(0.08),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
