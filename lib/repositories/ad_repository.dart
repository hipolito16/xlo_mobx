import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';
import 'package:xlo_mobx/stores/filter_store.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:path/path.dart' as path;

class AdRepository {
  Future<List<Ad>> getHomeAdList({
    FilterStore? filter,
    String? search,
    Category? category,
    int? page,
  }) async {
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.includeObject([keyAdOwner, keyAdCategoria]);

    queryBuilder.setAmountToSkip(page! * 10);

    queryBuilder.setLimit(10);

    queryBuilder.whereEqualTo(keyAdStatus, AdStatus.ACTIVE.index);

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyAdTitulo, search, caseSensitive: false);
    }

    if (category != null && category.id != '*') {
      queryBuilder.whereEqualTo(keyAdCategoria, (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id)).toPointer());
    }

    switch (filter!.orderBy) {
      case OrderBy.PRICE:
        queryBuilder.orderByAscending(keyAdPreco);
        break;
      case OrderBy.DATE:
      default:
        queryBuilder.orderByDescending(keyAdCreatedAt);
        break;
    }

    if (filter.minPrice != null && filter.minPrice! > 0) {
      queryBuilder.whereGreaterThanOrEqualsTo(keyAdPreco, filter.minPrice);
    }

    if (filter.maxPrice != null && filter.maxPrice! > 0) {
      queryBuilder.whereLessThanOrEqualTo(keyAdPreco, filter.maxPrice);
    }

    if (filter.vendorType > 0 && filter.vendorType < (VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL)) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());

      if (filter.vendorType == VENDOR_TYPE_PARTICULAR) {
        userQuery.whereEqualTo(keyUserType, UserType.PARTICULAR.index);
      }

      if (filter.vendorType == VENDOR_TYPE_PROFESSIONAL) {
        userQuery.whereEqualTo(keyUserType, UserType.PROFESSIONAL.index);
      }

      queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
    }

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((p) => Ad.fromParse(p)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }

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

  Future<List<Ad>> getMyAds() async {
    final currentUser = await ParseUser.currentUser();
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.setLimit(100);
    queryBuilder.orderByDescending(keyAdCreatedAt);
    queryBuilder.whereEqualTo(keyAdOwner, currentUser.toPointer());
    queryBuilder.includeObject([keyAdCategoria, keyAdOwner]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((p) => Ad.fromParse(p)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }

  Future<void> setAdSold(Ad ad) async {
    final currentUser = await ParseUser.currentUser();
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.whereEqualTo(keyAdOwner, currentUser.toPointer());
    queryBuilder.whereEqualTo(keyAdId, ad.id);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      final adObject = response.results![0];
      adObject.set<int>(keyAdStatus, AdStatus.SOLD.index);
      await adObject.save();
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }
}
