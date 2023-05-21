import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:path/path.dart' as path;

class AdRepository {
  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images!);
      final parseUser = await ParseUser.currentUser();
      final adObject = ParseObject(keyAdTable);
      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseAcl);

      adObject.set<String>(keyAdTitulo, ad.titulo!);
      adObject.set<String>(keyAdDescricao, ad.descricao!);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone!);
      adObject.set<num>(keyAdPreco, ad.preco!);
      adObject.set<int>(keyAdStatus, ad.status!.index);
      adObject.set<String>(keyAdBairro, ad.address!.bairro!);
      adObject.set<String>(keyAdCidade, ad.address!.cidade!.nome!);
      adObject.set<String>(keyAdUF, ad.address!.uf!.sigla!);
      adObject.set<String>(keyAdCEP, ad.address!.cep!);
      adObject.set<List<ParseFile>>(keyAdImages, parseImages);
      adObject.set<ParseUser>(keyAdOwner, parseUser);
      adObject.set<ParseObject>(keyAdCategoria, ParseObject(keyCategoryTable)..set(keyCategoryId, ad.categoria!.id));

      final response = await adObject.save();
      if (response.success) {
        return;
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code)!);
      }
    } catch (e) {
      return Future.error('Falha ao salvar anúncio');
    }
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (response.success) {
            parseImages.add(parseFile);
          } else {
            return Future.error(ParseErrors.getDescription(response.error!.code)!);
          }
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }
      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar imagens');
    }
  }
}
