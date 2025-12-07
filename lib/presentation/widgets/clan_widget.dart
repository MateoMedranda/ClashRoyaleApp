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
      height: 140,
      child: Card(
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: baseColor.withOpacity(0.8), // Aplicamos el mismo color del bullseye como borde
            width: 2.5, // Grosor del borde
          ),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Usamos el ícono Bullseye con efectos de sombra y borde
              ClipOval(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: 1.1, // Escala del ícono para darle un efecto de "flotación"
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: baseColor,
                    child: const Text(
                      '🎯', // Bullseye
                      style: TextStyle(fontSize: 38, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clan.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      clan.tag,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      clan.location != null && clan.location!['name'] != null
                          ? clan.location!['name']
                          : 'Sin ubicación',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${clan.members}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pts ${clan.clanScore}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
