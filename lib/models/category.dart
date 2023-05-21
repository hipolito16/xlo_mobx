import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class Category {
  Category({this.id, this.description});

  String? id;
  String? description;

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get<String>(keyCategoryDescription);
}
