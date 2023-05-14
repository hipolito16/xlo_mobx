import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  @computed
  String? get emailError => email == null || emailValid ? null : 'E-mail inválido';

  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 4;

  @computed
  String? get passwordError => password == null || passwordValid ? null : 'Senha inválida';

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(const Duration(seconds: 3));

    loading = false;
  }
}
