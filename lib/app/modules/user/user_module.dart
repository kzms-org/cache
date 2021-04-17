import 'package:flutter_modular/flutter_modular.dart';

import 'activity/activity_page.dart';
import 'settings/settings_page.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/activity', child: (_, args) => ActivityPage()),
        ChildRoute('/settings', child: (_, args) => SettingsPage()),
      ];
}
