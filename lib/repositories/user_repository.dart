import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';
import 'package:xlo_mobx/models/user.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name!);
    parseUser.set<String>(keyUserPhone, user.phone!);
    parseUser.set(keyType, user.type!.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId!,
      name: parseUser.get(keyUserName)!,
      email: parseUser.get(keyUserEmail)!,
      phone: parseUser.get(keyUserPhone)!,
      type: Type.values[parseUser.get(keyType)!],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }
}
