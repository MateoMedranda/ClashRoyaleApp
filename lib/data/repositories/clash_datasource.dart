import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/card_model.dart';
import '../datasources/base_datasource.dart';

class ClashRoyaleSource extends BaseDataSource<CardModel> {
  final String URL = "https://clashappbackend-cedn.onrender.com/api/cards";

  //Hacer un GET
  Future<List<CardModel>> fetchCardsData() async{
    final uri = Uri.parse(URL);

    final resp = await http.get(uri);
    //Hacer una Validación
    if (resp.statusCode != 200) {
      print("Error API: ${resp.body}");
      throw Exception("Error de conexión API: ${resp.statusCode}");
    }

    //Decodificar un JSON (jsonDecode)
    final data = jsonDecode(resp.body);
    final List results = data["items"];

    //Resultados (lista)
    return results.map((json) => CardModel.fromJson(json)).toList();
  }
}