import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/pythonapi/python_api.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ChatBotController {
  PythonApi pythonApi = Modular.get<PythonApi>();
  Map<String, Map<String, List<String>>> questions = {
    "Forecast": {
      "generic-question":[
              "How can I improve my spending?",],
      "time-based-question":[
          "How much will I most likely spend next",
          "Tell me my balance at the end of the ",
          ],
      "goal-based-question":[
        "Am I on track in achieving my spending goal?",
      ],
    },
    "Statistics":{
        "generic-question":[
          "Show my spending pattern",],
        "time-based-question":[
          "what is my average spending this ",
          "What is my total income this ",
        ],
        "goal-based-question":[],
      },
  };


  void uploadUserMessage(String message, BuildContext context) {
    final user = Provider.of<SimpleUser>(context, listen: false);
    //Database(uid: user.uid).uploadMessage(message, true, user.firstName);
    chatBotReply(message);
  }
  void chatBotReply(String message){
    var response;
    var route;
    if(message == "Show my spending pattern") {

    }
    else if(message == "How can I improve my spending?") {
      route = "/financialAdvising";
      response = pythonApi.financialAdviceReply();
    }

  }


  void uploadUserMessageTimeBased(String oldMessage, BuildContext context, String dropdownValue) {
    final user = Provider.of<SimpleUser>(context, listen:false);

    String newMessage = oldMessage.split("...")[0] + " "+dropdownValue;

    Database(uid: user.uid).uploadMessage(newMessage, true, user.firstName);
    
    // once the user uploads message. make the chatbot give a reply
    chatBotReplyTimeBased(oldMessage, dropdownValue, context);
  }
  Future<void> chatBotReplyTimeBased(String message, String dropdownValue, BuildContext context) async {
    var route;
    final user = Provider.of<SimpleUser>(context, listen:false);

    if(message == "How much will I most likely spend next..." && dropdownValue != null) {
      int days = convertDropDownValueToDays(dropdownValue);
      route = "/spendingForecast";
      await pythonApi.getTransactionData(user.uid);

      Future.delayed(Duration(seconds: 2),() {
        print(pythonApi.amounts);
        Map<String, dynamic> jsonifiedTransactions = {"ds":pythonApi.dates, "y":pythonApi.amounts};
        pythonApi.spendingForecastReply(jsonifiedTransactions,days, user.uid,route).then((response) {
         print("inside response");
         Database(uid: user.uid).uploadMessage(response.body.toString(), false, "ChatBot");

       }) ;
      });

    }
    else if(message == "Tell me my balance at the end of the..." && dropdownValue != null) {
      route = "/balanceForecast";
      int days = convertDropDownValueToDays(dropdownValue);
      await pythonApi.getTransactionData(user.uid);
      await pythonApi.getBalanceData(user.uid);
      Database(uid: user.uid).uploadMessage("One moment please.", false, "ChatBot");
      Future.delayed(Duration(seconds: 4),() {
        Map<String, dynamic> jsonifiedTransactions = {"ds":pythonApi.dates, "y":pythonApi.amounts};
        pythonApi.balanceForecastReply(jsonifiedTransactions,pythonApi.balance,days, user.uid,route).then((response) {
          print("Balance forecast response");
          Database(uid: user.uid).uploadMessage(response.body.toString(), false, "ChatBot");

        });
      });
    }
    else if(message == "What is my average spending this..." && dropdownValue != null) {
    }
    else if(message == "What is my total income this..." && dropdownValue != null) {
    }

 }
 int convertDropDownValueToDays(String dropdownValue){
    int days;
    if(dropdownValue == "Week"){
      days = 7;
    }else if(dropdownValue == "Month"){
      days = 30;
    }else if(dropdownValue == "Year"){
      days = 365;
    }
    return days;
 }


  void uploadUserMessageGoalBased(String message, BuildContext context, double savingAmount, DateTime goalDate) {

    final user = Provider.of<SimpleUser>(context, listen: false);
    //Database(uid: user.uid).uploadMessage(message, true, user.firstName);
    // once the user uploads message. make the chatbot give a reply
    chatBotReplyGoalBased(message, savingAmount, goalDate);
  }
  void chatBotReplyGoalBased(String message, double savingAmount, DateTime goalDate){
    var response;
    var route;

    // find the days from goal date - current date
    print(message);
    print(savingAmount);
    print(goalDate);

    if(message == "Am I on track in achieving my spending goal?" && savingAmount != null && goalDate != null ) {
      route = "/goalTracking";
      response = pythonApi.goalTrackingReply();
    }

  }


}