import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/modules/security/profile/profile_page.dart';
import 'package:cache/app/modules/security/signup/signup_page.dart';

import 'authentication_types/authentication_types_page.dart';
import 'login/login_controller.dart';
import 'login/login_page.dart';
import 'signup/signup_controller.dart';

class SecurityModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => SignUpController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/auth-types',
            child: (_, args) => AuthenticationTypesPage()),
        ModularRouter('/login', child: (_, args) => LoginPage()),
        ModularRouter('/signup', child: (_, args) => SignUpPage()),
        ModularRouter('/profile', child: (_, args) => ProfilePage()),
      ];
}
