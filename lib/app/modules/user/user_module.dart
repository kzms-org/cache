import 'package:flutter_modular/flutter_modular.dart';

import 'activity/activity_page.dart';
import 'settings/settings_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/activity', child: (_, args) => ActivityPage()),
        ModularRouter('/settings', child: (_, args) => SettingsPage()),
      ];
}
