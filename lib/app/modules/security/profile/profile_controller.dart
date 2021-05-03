import 'package:cache/app/modules/security/auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final _auth = AuthService();

  Future<void> signOut(){
    _auth.signOut();
    print("successfully signed out of the cache app");
    return Modular.to.pushReplacementNamed("/security/auth-types");
  }

}
