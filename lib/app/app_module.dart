import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/security/security_module.dart';
import 'modules/user/user_module.dart';
import 'modules/wallet/wallet_module.dart';


class AppModule extends MainModule {

  // Provide a list of dependencies to inject into Cache
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  // Provide all routes for the modular app
  @override
  List<ModularRouter> get routers => [
        ModularRouter('/security', module: SecurityModule()),
        ModularRouter('/wallet', module: WalletModule()),
        ModularRouter('/user', module: UserModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
