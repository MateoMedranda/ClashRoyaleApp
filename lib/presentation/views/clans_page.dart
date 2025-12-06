import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/clan_viewmodel.dart';
import '../widgets/clan_widget.dart';

class ClansPage extends StatelessWidget {
  const ClansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ClanViewModel>(context);

    return Scaffold(
      // AppBar with subtle gradient using flexibleSpace
      appBar: AppBar(
        title: const Text('Clanes de Clash Royale'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      // Background gradient for the page
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF3E5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: vm.loading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF1976D2)),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemCount: vm.items.length,
                    itemBuilder: (context, i) {
                      final clan = vm.items[i];

                      // derive a pleasant color from badgeId
                      final int colorSeed = clan.badgeId;
                      final int raw = (colorSeed * 9973) & 0x00FFFFFF;
                      final Color rowColor = Color(0xFF000000 | raw).withOpacity(1.0);

                      return Card(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          tileColor: rowColor.withOpacity(0.08),
                          leading: CircleAvatar(
                            backgroundColor: rowColor,
                            child: const Text('🎯', style: TextStyle(fontSize: 18)),
                          ),
                          title: Text(clan.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(clan.tag),
                              const SizedBox(height: 4),
                              Text(
                                clan.location != null && clan.location!['name'] != null
                                    ? clan.location!['name']
                                    : 'Sin ubicación',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${clan.members}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text('Pts ${clan.clanScore}', style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                          onTap: () {
                            // placeholder for detail navigation later
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
