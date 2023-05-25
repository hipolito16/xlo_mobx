import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({this.id, this.name, this.email, this.phone, this.password, this.type = UserType.PARTICULAR, this.createdAt});

  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  UserType? type;
  DateTime? createdAt;

  User.fromParse(ParseUser parseUser) {
    id = parseUser.objectId;
    name = parseUser.get<String>(keyUserName);
    email = parseUser.get<String>(keyUserEmail);
    phone = parseUser.get<String>(keyUserPhone);
    type = UserType.values[parseUser.get<int>(keyUserType)!];
    createdAt = parseUser.createdAt;
  }
}
