import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';
import 'package:dio/dio.dart';

class IBGERepository {
  Future<List<UF>?> getUFListFromApi() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('UF_LIST')) {
      final jsonList = json.decode(preferences.getString('UF_LIST')!);
      return jsonList.map<UF>((e) => UF.fromJson(e)).toList()..sort();
    }

    const endpoint = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      await Dio().get<List>(endpoint).then((response) {
        preferences.setString('UF_LIST', json.encode(response.data));
        return response.data!.map<UF>((e) => UF.fromJson(e)).toList()..sort();
      });
    } on DioError {
      return Future.error('Falha ao obter lista de Estados.');
    }
    return null;
  }

  Future<List<City>?> getCityListFromApi(UF uf) async {
    final String endpoint = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      await Dio().get<List>(endpoint).then((response) {
        return response.data!.map<City>((e) => City.fromJson(e)).toList()..sort();
      });
    } on DioError {
      return Future.error('Falha ao obter lista de Cidades.');
    }
    return null;
  }
}
