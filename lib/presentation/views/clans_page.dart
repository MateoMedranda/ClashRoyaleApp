import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/clan_viewmodel.dart';
import '../widgets/clan_widget.dart';
import '../widgets/shimmer_loading.dart';
import '../widgets/fade_in_animation.dart';
import '../widgets/custom_animations.dart';

class ClansPage extends StatelessWidget {
  const ClansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ClanViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clanes de Clash Royale',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1976D2), Color(0xFF0D47A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF3E5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: vm.loading
            ? const ShimmerListLoading(itemCount: 6, height: 120)
            : vm.items.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.groups, size: 80, color: Colors.grey[300]),
              const SizedBox(height: 16),
              Text(
                'No hay clanes disponibles',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
            : FadeInAnimation(
          duration: const Duration(milliseconds: 800),
          slideUp: true,
          child: RefreshIndicator(
            onRefresh: () async {
              await vm.loadData();
            },
            child: SafeArea(
              child: Builder(
                builder: (context) {
                  final double bottomInset =
                      MediaQuery.of(context).padding.bottom + 16.0;
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      16.0,
                      12.0,
                      16.0,
                      bottomInset,
                    ),
                    itemCount: vm.items.length,
                    itemBuilder: (context, i) {
                      final clan = vm.items[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ScaleSwapAnimation(
                          duration: Duration(
                            milliseconds: 400 + (i * 150),
                          ),
                          child: SizedBox(
                            height: 160,
                            child: ClanWidget(clan: clan),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
