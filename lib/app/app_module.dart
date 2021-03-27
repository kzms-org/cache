import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/security/security_module.dart';
import 'modules/user/user_module.dart';
import 'modules/wallet/wallet_module.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/security', module: SecurityModule()),
        ModularRouter('/wallet', module: WalletModule()),
        ModularRouter('/user', module: UserModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
