import 'dart:async';

import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:cache/app/modules/wallet/chatbot/chat_message.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_controller.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Modal{
  ChatBotController chatBotController = ChatBotController();
  mainBottomSheet(BuildContext context, List<String> data){

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          for ( var i in data )

              _createTile(context, i.toString(), Icons.message ),
            ],
          );
        }
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        _sendToCloud(name, context);
        Navigator.pop(context);


      },
    );
  }

  _sendToCloud(String message, BuildContext context){
    chatBotController.uploadUserMessage(message, context);
  }

}