import 'auth_repository_interface.dart';
import 'package:http/http.dart' as http;
import '../models/auth_user_module.dart';

class AuthRepository implements IAuthRepository {
  AuthUserModel _user;

  @override
  Future<AuthUserModel> getEmailPasswordLogin(String name, String email) {
    print('email authrepo: '+ email);
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    return null;
  }

  @override
  Future<AuthUserModel> getTwitterLogin() {
    return getUser();
  }

  @override
  Future<AuthUserModel> getUser() {
    return Future.delayed(Duration(seconds: 0), () => _user);
  }

  @override
  Future logout() async {
    _user = null;
  }
}
