import 'package:cache/app/modules/security/auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final _auth = AuthService();

  @observable
  bool loading = false;

  @action
  Future signUp(String firstName, String lastName, String email, String emailConfirmation, String password) async {
    try {
      loading = true;

      // check if email and email confirmation are identical
      if(email == emailConfirmation && password != null){

        // register the user
        dynamic result = await _auth.signUpWithEmailAndPassword(email, password, firstName,lastName);
        print(result);

        if(result == null){
          print('error signing up.. Try Again!');
        }else{
          print('signed in check result below');
          print(result);
          Modular.to.pushReplacementNamed("/wallet");
        }

      }else{
        print("ERROR Either email is incorrect, or email and confirmation email don't match or password not given");
      }

    } catch (e) {
      loading = true;
    }

  }
}
