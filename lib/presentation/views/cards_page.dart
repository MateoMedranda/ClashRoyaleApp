import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/card_viewmodel.dart';
import '../../domain/entities/card.dart';
import '../widgets/card_widget.dart';
import '../widgets/shimmer_loading.dart';
import '../widgets/fade_in_animation.dart';
import '../widgets/custom_animations.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CardViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Colección de cartas"),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
      ),
      body: vm.loading
          ? const ShimmerGridLoading(
              itemCount: 8,
              crossAxisCount: 2,
              aspectRatio: 0.70,
            )
          : vm.items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_on, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'No hay cartas disponibles',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : FadeInAnimation(
              duration: const Duration(milliseconds: 600),
              slideUp: true,
              child: RefreshIndicator(
                onRefresh: () async {
                  await vm.loadData();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: vm.items.length,
                    itemBuilder: (_, i) {
                      final CardEntity c = vm.items[i];
                      return ScaleSwapAnimation(
                        duration: Duration(milliseconds: 400 + (i * 100)),
                        child: CardWidget(card: c),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
