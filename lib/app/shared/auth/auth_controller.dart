import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:cache/app/shared/auth/repositories/auth_repository_interface.dart';

import 'models/auth_user_module.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  AuthUserModel user;

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @action
  setUser(AuthUserModel value) => user = value;

  @action
  Future loginWithEmailPassword(String email, String password) async {
    user = await _authRepository.getEmailPasswordLogin(email, password);
  }

  Future loginTwitter() async {
    user = await _authRepository.getTwitterLogin();
  }

  Future logoff() async {
    await _authRepository.logout();
  }

  Future signUp() async {
    await _authRepository.logout();
  }
}
