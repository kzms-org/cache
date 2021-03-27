import '../models/auth_user_module.dart';

abstract class IAuthRepository {
  Future<AuthUserModel> getUser();
  Future<AuthUserModel> getEmailPasswordLogin(String name, String email);
  Future<AuthUserModel> getTwitterLogin();
  Future<String> getToken();
  Future logout();
}
