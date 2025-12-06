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
                child: Builder(builder: (context) {
                  final double bottomInset = MediaQuery.of(context).padding.bottom + 12.0;
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, bottomInset),
                    itemCount: vm.items.length,
                    itemBuilder: (context, i) {
                      final clan = vm.items[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SizedBox(
                          height: 150,
                          child: ClanWidget(clan: clan),
                        ),
                      );
                    },
                  );
                })),
      ),
    );
  }
}
