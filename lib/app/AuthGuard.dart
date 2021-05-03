import 'package:cache/app/modules/security/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard implements RouteGuard{
  @override
  Future<bool> canActivate(String path, ModularRoute<dynamic> router) async{
    print(router.routerName);
    print("path"+path);
    print(FirebaseAuth.instance.currentUser);
    if(path == "/" && FirebaseAuth.instance.currentUser != null)
      return true;
    if(path == "/wallet/" && FirebaseAuth.instance.currentUser != null)
      return true;
    if(path == "/wallet" && FirebaseAuth.instance.currentUser != null)
      return true;
    if(path == "//" && FirebaseAuth.instance.currentUser != null)
      return true;
    return false;

  }

}