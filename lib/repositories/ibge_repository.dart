import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';
import 'package:dio/dio.dart';

class IBGERepository {
  Future<List<UF>> getUFListFromApi() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('UF_LIST')) {
      final jsonList = json.decode(preferences.getString('UF_LIST')!);

      return jsonList.map<UF>((e) => UF.fromJson(e)).toList()..sort((UF a, UF b) => a.nome!.toLowerCase().compareTo(b.nome!.toLowerCase()));
    }

    const endpoint = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(endpoint);

      preferences.setString('UF_LIST', json.encode(response.data));

      return response.data!.map<UF>((e) => UF.fromJson(e)).toList()..sort((a, b) => a.nome!.toLowerCase().compareTo(b.nome!.toLowerCase()));
    } on DioError {
      return Future.error('Falha ao obter lista de Estados');
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final String endpoint = 'http://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(endpoint);

      return response.data!.map<City>((e) => City.fromJson(e)).toList()..sort((a, b) => a.nome!.toLowerCase().compareTo(b.nome!.toLowerCase()));
    } on DioError {
      return Future.error('Falha ao obter lista de Cidades');
    }
  }
}
