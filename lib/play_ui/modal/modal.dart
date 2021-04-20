import 'dart:async';

import 'package:cache/app/modules/wallet/chatbot/chat_message.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

StreamController<dynamic> streamController = new StreamController<ChatMessage>();

class Modal{

  mainBottomSheet(BuildContext context, List<String> data){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          for ( var i in data )

              _createTile(context, i.toString(), Icons.message,  _sendToCloud(i.toString())),
            ],
          );
        }
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);

      },
    );
  }

  _sendToCloud(String str){
    streamController.add(new ChatMessage(
      type: true,
      name: "Anonymous",
      text: str,
    ));

    Map <String,dynamic> user_question= {"Message": "Message", "Question":str};
    FirebaseFirestore.instance.collection("questions").add(user_question);
    print("works");
  }

  _action2(){
    print('action 2');
  }

  _action3(){
    print('action 3');
  }
}