import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/clan_model.dart';
import '../datasources/base_datasource.dart';

class ClashClansSource extends BaseDataSource<ClanModel> {
  final String URL = "https://clashappbackend-cedn.onrender.com/api/clans";

  Future<List<ClanModel>> fetchCardsData() async {
    final uri = Uri.parse(URL);
    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      print("Error API (clans): ${resp.body}");
      throw Exception("Error de conexión API: ${resp.statusCode}");
    }

    final data = jsonDecode(resp.body);
    List results = [];
    if (data is List) {
      results = data;
    } else if (data is Map && data["items"] != null) {
      results = data["items"];
    } else if (data is Map && data["clans"] != null) {
      results = data["clans"];
    }

    return results.map((json) => ClanModel.fromJson(json)).toList();
  }
}
