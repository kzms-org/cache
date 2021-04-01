import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/modules/wallet/edit_item/edit_item_page.dart';
import 'package:cache/app/modules/wallet/open_item/open_item_page.dart';

import 'accounts/accounts_page.dart';
import 'add_funds/add_funds_page.dart';
import 'my_wallet/my_wallet_page.dart';
import 'records/records_page.dart';
import 'send_request/send_request_page.dart';
import 'shopping_list/shopping_list_page.dart';
import 'chatbot/chatbot_page.dart';

class WalletModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => MyWalletPage()),
        ModularRouter('/records', child: (_, args) => RecordsPage()),
        ModularRouter('/shopping-list', child: (_, args) => ShoppingListPage()),
        ModularRouter('/accounts', child: (_, args) => AccountsPage()),
        ModularRouter('/add-funds', child: (_, args) => AddFundsPage()),
        ModularRouter('/send-request', child: (_, args) => SendRequestPage()),
        ModularRouter('/open-item', child: (_, args) => OpenItemPage()),
        ModularRouter('/edit-item', child: (_, args) => EditItemPage()),
        ModularRouter('/chatbot', child: (_, args) => ChatbotPage()),
      ];
}
