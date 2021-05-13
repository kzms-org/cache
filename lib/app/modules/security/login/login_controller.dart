import 'dart:convert';
import 'package:cache/app/modules/security/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:cache/app/modules/security/auth.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  String email;
  String password;

  final AuthService _auth = AuthService();

  @observable
  bool loading = false;

  @action
  Future loginWithUsernameAndPassword(String email, String password, BuildContext context) async {

    try {
      loading = true;
      dynamic result = await _auth.logInWithEmailAndPassword(email, password);
      print(result);
      if(result == null){
        print(result);
      }else{
        print('signed in check result below');
        Modular.to.pushReplacementNamed("/wallet/dashboard");
      }
    } catch (e) {
      loading = true;
    }
  }

  signUp() {
    Modular.to.pushReplacementNamed('/security/signup');
  }

  logoff() async {

  }
}
