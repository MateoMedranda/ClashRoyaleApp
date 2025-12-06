import 'package:flutter/material.dart';
import '../views/cards_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (_) => CardsPage(),
  };
}
