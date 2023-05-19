import 'package:xlo_mobx/repositories/ibge_repository.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:dio/dio.dart';

class CepRepository {
  Future<Address?> getAddressFromApi(String cep) async {
    if (cep.isEmpty) {
      return Future.error('CEP Inválido.');
    }

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) {
      return Future.error('CEP Inválido.');
    }

    final endpoint = 'https://viacep.com.br/ws/$clearCep/json/';

    try {
      await Dio().get<Map>(endpoint).then((response) async {
        if (response.data!.containsKey('erro') && response.data?['erro']) {
          return Future.error('CEP Inválido.');
        }

        final ufList = await IBGERepository().getUFListFromApi();
        return Address(
          cep: response.data!['cep'] ?? '',
          bairro: response.data!['bairro'] ?? '',
          cidade: City(nome: response.data!['localidade'] ?? ''),
          uf: ufList!.firstWhere((uf) => uf.sigla == response.data!['uf']),
        );
      });
    } catch (e) {
      return Future.error('Falha ao buscar CEP.');
    }
    return null;
  }
}
