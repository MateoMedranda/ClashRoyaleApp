import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/clash_datasource.dart';
import 'data/repositories/card_repository.dart';
import 'domain/usecases/get_cards_data_usecase.dart';
import 'presentation/viewmodels/card_viewmodel.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  final datasource = ClashRoyaleSource();
  final repository = CardsRepository(datasource);
  final useCase = GetCardsDataUseCase(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardViewModel(useCase)..loadData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: AppRoutes.routes,
      ),
    ),
  );
}
