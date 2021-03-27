// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpControllerBase, Store {
  final _$signUpAsyncAction = AsyncAction('signUp');

  @override
  Future<dynamic> signUp(String username, String email,
      String emailConfirmation, String password) {
    return _$signUpAsyncAction
        .run(() => super.signUp(username, email, emailConfirmation, password));
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}
