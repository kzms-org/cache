import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  @action
  Future signUp(
    String username,
    String email,
    String emailConfirmation,
    String password,
  ) async {
    Modular.to.pushReplacementNamed('/wallet');
  }
}
