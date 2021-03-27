import 'package:mobx/mobx.dart';
part 'shopping_list_controller.g.dart';

class ShoppingListController = _ShoppingListControllerBase
    with _$ShoppingListController;

abstract class _ShoppingListControllerBase with Store {}
