import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/theme.dart';

class AppWidget extends StatelessWidget with ThemeMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet UI',
      theme: getTheme(context),
      initialRoute: '/security/auth-types',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
