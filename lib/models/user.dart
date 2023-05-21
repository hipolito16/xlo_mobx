import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

enum Type { PARTICULAR, PROFESSIONAL }

class User {
  User({this.id, this.name, this.email, this.phone, this.password, this.type = Type.PARTICULAR, this.createdAt});

  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  Type? type;
  DateTime? createdAt;

  User.fromParse(ParseUser parseUser) {
    id = parseUser.objectId;
    name = parseUser.get<String>(keyUserName);
    email = parseUser.get<String>(keyUserEmail);
    phone = parseUser.get<String>(keyUserPhone);
    type = Type.values[parseUser.get<int>(keyType)!];
    createdAt = parseUser.createdAt;
  }
}
