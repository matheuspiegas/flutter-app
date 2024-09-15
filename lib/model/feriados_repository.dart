import 'dart:convert';

import 'package:flutterteste/core/constants.dart';
import 'package:flutterteste/model/feriados_model.dart';
import 'package:http/http.dart' as http;

class FeriadosRepository {
  final Uri url = Uri.parse('$urlApiFeriados/2024');
  Future<List<FeriadoEntity>> getFeriados() async {
    List<FeriadoEntity> feriadosList = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (var feriado in json) {
        feriadosList.add(FeriadoEntity.fromJson(feriado));
      }
    }
    return feriadosList;
  }
}
