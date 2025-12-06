import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/card_viewmodel.dart';
import '../../domain/entities/card.dart';
import '../widgets/card_widget.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CardViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Colección de cartas"),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),

      body: vm.loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.70,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: vm.items.length,
          itemBuilder: (_, i) {
            final CardEntity c = vm.items[i];
            return CardWidget(card: c);
          },
        ),
      ),
 //solo lo agregue para probar la navegacion, saludos
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ver clanes',
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.group),
        onPressed: () => Navigator.pushNamed(context, '/clans'),
      ),

    );
  }
}