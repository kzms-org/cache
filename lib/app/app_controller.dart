import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

// https://stackoverflow.com/questions/57243896/with-keyword-in-flutter
// To understand what the with keyword in flutter does.

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {}
