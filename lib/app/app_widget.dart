import 'dart:io';

import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:cache/app/modules/wallet/my_wallet/my_wallet_page.dart';
import 'package:cache/app/modules/wallet/wallet_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/theme.dart';
import 'package:provider/provider.dart';
import 'modules/user/cacheuser.dart';

class AppWidget extends StatelessWidget with ThemeMixin {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CacheUser>(context);


    if (user == null) {
      print("user is null at the momeont");
      // if there is no user
      return MaterialApp(
        title: 'Cache',
        debugShowCheckedModeBanner: false,
        theme: getTheme(context),
        initialRoute: "/security/auth-types",
      ).modular();
    } else {
      print("INSIDE SIMPLE USER STREAM PROV INIT");
      print(user.uid);
      // if user is authenticated
      return StreamProvider<SimpleUser>.value(
          value: Database(uid: user.uid).getUserData(user.uid),
          initialData: null,
          child: MaterialApp(
            title: 'Cache',
            debugShowCheckedModeBanner: false,
            theme: getTheme(context),
            initialRoute: "/wallet/"
          ).modular());
    }
  }
}
