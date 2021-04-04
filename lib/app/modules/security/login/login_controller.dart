import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  String email;
  String password;



  @observable
  bool loading = false;

  @action
  Future loginWithUsernameAndPassword(String email, String password) async {
    try {
      loading = true;
      //await authController.loginWithEmailPassword(email, password);
      Modular.to.pushReplacementNamed('/wallet');
    } catch (e) {
      loading = true;
    }
  }

  signUp() {
    Modular.to.pushReplacementNamed('/security/signup');
  }

  logoff() async {

  }
}
