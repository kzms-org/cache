import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:cache/app/shared/auth/auth_controller.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  String email;
  String password;

  AuthController authController = Modular.get();

  @observable
  bool loading = false;

  @action
  Future<dynamic> loginWithUsernameAndPassword(String email, String password) async {
    print("email: in logincontroller "+email);
    final url  = "https://10.0.2.2:5000/test";
    Modular.to.pushReplacementNamed('/wallet');
    return await http.post(
      //Uri.http('10.0.2.2', 'test'),
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );

  }

  // Future loginWithUsernameAndPassword(String email, String password) async {
  //   try {
  //     loading = true;
  //     await authController.loginWithEmailPassword(email, password);
  //     //Modular.to.pushReplacementNamed('/wallet');
  //   } catch (e) {
  //     loading = true;
  //   }
  // }

  signUp() {
    Modular.to.pushReplacementNamed('/security/signup');
  }

  logoff() async {
    await authController.logoff();
  }
}
