 import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/pythonapi/python_api.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ChatBotController {
  PythonApi pythonApi = PythonApi();
  Map<String, List<String>> questions = {
    "Forecast": [
      "Show me my forecast for the next week.",
      "How much will I have at the end of the month?"
    ],
    "Statistics": [
      "How much money am I spending on average.",
      "My income this month.",
      "My income this year.",
      "Show me the spending graph."
    ]
  };
  void sendMessage(){
    // send msg to database

    // call chatbot part to do its job. while it is working. just show an animation that it is typing
  }

  void uploadUserMessage(String message, BuildContext context) {

    final user = Provider.of<SimpleUser>(context, listen: false);
    Database(uid: user.uid).uploadMessage(message, true, user.firstName);

    // once the user uploads message. make the chatbot give a reply
    chatBotReply();
  }

  void chatBotReply(){

    // need to send a csv, the question to get a reply
    pythonApi.getChatBotReply("/chatbotReply", questions, questions);
  }

}