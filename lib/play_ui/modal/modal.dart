import 'dart:async';

import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:cache/app/modules/wallet/chatbot/chat_message.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_controller.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Modal{
  final chatBotController = Modular.get<ChatBotController>();
  String dropdownValue;


}