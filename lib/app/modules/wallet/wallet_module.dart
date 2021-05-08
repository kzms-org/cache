import 'package:cache/app/AuthGuard.dart';
import 'package:cache/app/modules/pythonapi/python_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'accounts/accounts_page.dart';
import 'add_funds/add_funds_controller.dart';
import 'add_funds/add_funds_page.dart';
import 'chatbot/chatbot_controller.dart';
import 'full_photo/full_photo.dart';
import 'my_wallet/my_wallet_page.dart';
import 'records/records_page.dart';
import 'send_request/send_request_page.dart';
import 'chatbot/chatbot_page.dart';

class WalletModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => AddFundsController()),
    Bind((i) => ChatBotController()),
    Bind((i) => PythonApi()),
  ];

  @override
  List<ModularRoute> get routes => [
      ChildRoute('/dashboard', child: (_, args) => MyWalletPage()),
      ChildRoute('/records', child: (_, args) => RecordsPage()),
      ChildRoute('/accounts', child: (_, args) => AccountsPage()),
      ChildRoute('/add-funds', child: (_, args) => AddFundsPage()),
      ChildRoute('/add-single-transaction', child: (_, args) => SendRequestPage(initialIndex: args.data)),
      ChildRoute('/chatbot', child: (_, args) => ChatbotPage()),
      ChildRoute('/full-photo', child: (_, args) => FullPhoto(url: args.data)),
      ];
}
