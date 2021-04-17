import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/app/modules/wallet/edit_item/edit_item_page.dart';
import 'package:cache/app/modules/wallet/open_item/open_item_page.dart';

import 'accounts/accounts_page.dart';
import 'add_funds/add_funds_controller.dart';
import 'add_funds/add_funds_page.dart';
import 'my_wallet/my_wallet_page.dart';
import 'records/records_page.dart';
import 'send_request/send_request_page.dart';
import 'chatbot/chatbot_page.dart';

class WalletModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => AddFundsController()),
  ];

  @override
  List<ModularRoute> get routes => [
      ChildRoute('/', child: (_, args) => MyWalletPage()),
      ChildRoute('/records', child: (_, args) => RecordsPage()),
      ChildRoute('/accounts', child: (_, args) => AccountsPage()),
      ChildRoute('/add-funds', child: (_, args) => AddFundsPage()),
      ChildRoute('/send-request', child: (_, args) => SendRequestPage()),
      ChildRoute('/open-item', child: (_, args) => OpenItemPage()),
      ChildRoute('/edit-item', child: (_, args) => EditItemPage()),
      ChildRoute('/chatbot', child: (_, args) => ChatbotPage()),
      ];
}
