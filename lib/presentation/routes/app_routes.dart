import 'package:flutter/material.dart';
import '../views/cards_page.dart';
import '../views/clans_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (_) => CardsPage(),
    "/clans": (_) => ClansPage(),
  };
}
