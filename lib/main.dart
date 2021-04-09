import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:cache/app/modules/user/cacheuser.dart';
import 'app/modules/security/auth.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StreamProvider<CacheUser>.value(
      value: AuthService().user,
      child: ModularApp(
        module: AppModule(),
      ))
    );
}
