import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/theme.dart';
import 'package:provider/provider.dart';
import 'modules/user/cacheuser.dart';

class AppWidget extends StatelessWidget with ThemeMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cache',
      theme: getTheme(context),
      initialRoute: returnInitialRoute(context),

    ).modular();
  }

  String returnInitialRoute(BuildContext context) {
    final user = Provider.of<CacheUser>(context);

    if(user == null)
      return "/security/auth-types";
    else
      return "/wallet";
  }

}