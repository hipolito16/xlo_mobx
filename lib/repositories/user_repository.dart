import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';
import 'package:xlo_mobx/models/user.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name!);
    parseUser.set<String>(keyUserPhone, user.phone!);
    parseUser.set(keyUserType, user.type!.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return User.fromParse(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return User.fromParse(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code)!);
    }
  }

  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response = await ParseUser.getCurrentUserFromServer(parseUser.sessionToken!);

      if (response!.success) {
        return User.fromParse(response.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }
}
