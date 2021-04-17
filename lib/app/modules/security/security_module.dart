import 'package:cache/app/modules/security/profile/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/modules/security/profile/profile_page.dart';
import 'package:cache/app/modules/security/signup/signup_page.dart';
import 'authentication_types/authentication_types_page.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';
import 'signup/signup_controller.dart';

class SecurityModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => SignUpController()),
        Bind((i) => ProfileController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/auth-types',
            child: (_, args) => AuthenticationTypesPage()),
        ChildRoute('/login', child: (_, args) => LoginPage()),
        ChildRoute('/signup', child: (_, args) => SignUpPage()),
        ChildRoute('/profile', child: (_, args) => ProfilePage()),
      ];
}
