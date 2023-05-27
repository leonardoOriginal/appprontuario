import 'dart:convert';
import 'dart:io';
import 'package:vida_leve/utils/model_data.dart';
import 'package:http/http.dart' as http;

///Classe que controla as requisições dos horários/agendas.
class FakerApi {
  ///Função para obter os horários disponíveis com base nos paramêtros obrigatórios.
  static Future<List<Data>> getData() async {
    String url = '';
    url =
        'https://fakerapi.it/api/v1/persons?_quantity=1000&_gender=male&_birthday_start=2023-01-25&_birthday_end=2023-12-31';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Data> list = parseSchedules(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Data> parseSchedules(String responseBody) {
    final parsed = json.decode(responseBody);
    return parsed["data"].map<Data>((json) => Data.fromJson(json)).toList();
  }
}
