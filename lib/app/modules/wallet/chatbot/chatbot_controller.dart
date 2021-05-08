import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/pythonapi/python_api.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ChatBotController {
  PythonApi pythonApi = Modular.get<PythonApi>();
  Map<String, Map<String, List<String>>> questions = {
    "Forecast": {
      "generic-question": [
        "How can I improve my spending?",
      ],
      "time-based-question": [
        "How much will I most likely spend next",
        "Tell me my balance at the end of the ",
      ],
      "goal-based-question": [
        "Am I on track in achieving my spending goal?",
      ],
    },
    "Statistics": {
      "generic-question": [
        "what is my average spending this week",
        "Show my spending pattern",
      ],
      "time-based-question": [

        "What is my total income this ",
      ],
      "goal-based-question": [],
    },
  };

  void uploadUserMessage(String message, BuildContext context) {
    final user = Provider.of<SimpleUser>(context, listen: false);
    Database(uid: user.uid).uploadMessage(message, true, user.firstName, true);
    chatBotReply(message, context);
  }
  Future<void> chatBotReply(String message, BuildContext context) async {
    var route;
    final user = Provider.of<SimpleUser>(context, listen: false);
    if (message == "Show my spending pattern") {
      if(pythonApi.dates.isEmpty)
        sendFeatureUnavailMsg(user);
      else {
        Modular.to.pushReplacementNamed("/wallet/dashboard");
      }
    } else if (message == "How can I improve my spending?") {
      route = "/financialAdvising";
      await pythonApi.getTransactionData(user.uid);

      Future.delayed(Duration(seconds: 4), () {
        Map<String, dynamic> jsonifiedTransactions = {
          "ds": pythonApi.dates,
          "y": pythonApi.amounts
        };
        if(pythonApi.dates.isEmpty)
          sendFeatureUnavailMsg(user);
        else {
          pythonApi.financialAdviceReply(jsonifiedTransactions, user.uid, route)
              .then((response) {
            print("financial advice response");
            Map<String, dynamic> data = json.decode(response.body);

            Database(uid: user.uid).uploadMessage(
                data["message"], false, "ChatBot", true);
          });
        }
      });

    } else if (message == "what is my average spending this week"){
      if(pythonApi.dates.isEmpty)
        sendFeatureUnavailMsg(user);
      else {
        print("AVG SPENDING");
        DateTime currentDate = DateTime.now();
        var lastMonday = currentDate.subtract(Duration(days: 7));
        // Database(uid: user.uid).getExpenseSnapshot(limit)
      }
    }

  }

  void timeBased(  String oldMessage, BuildContext context, String dropdownValue) {
    final user = Provider.of<SimpleUser>(context, listen: false);
    String newMessage = oldMessage.split("...")[0] + " " + dropdownValue;
    Database(uid: user.uid).uploadMessage(newMessage, true, user.firstName, true);
    timeBasedReply(oldMessage, dropdownValue, context);
  }
  Future<void> timeBasedReply(String message, String dropdownValue, BuildContext context) async {
    var route;
    final user = Provider.of<SimpleUser>(context, listen: false);
    if (message == "How much will I most likely spend next..." &&  dropdownValue != null) {
      int days = convertDropDownValueToDays(dropdownValue);
      route = "/spendingForecast";
      await pythonApi.getTransactionData(user.uid);

        Future.delayed(Duration(seconds: 2), () {
          print(pythonApi.amounts);
          Map<String, dynamic> jsonifiedTransactions = {
            "ds": pythonApi.dates,
            "y": pythonApi.amounts
          };
          if(pythonApi.dates.isEmpty)
            sendFeatureUnavailMsg(user);
          else {
            pythonApi.spendingForecastReply(
                jsonifiedTransactions, days, user.uid, route).then((
                response) async {
              print("inside response");

              Map<String, dynamic> data = json.decode(response.body);

              File testImage = await byteImagetoImage(data["image"]);
              Database(uid: user.uid).uploadFile(
                  testImage, false, "ChatBot", false);
              Database(uid: user.uid).uploadMessage(
                  data["message"], false, "ChatBot", true);
            });
          }
        });

    }
    else if (message == "Tell me my balance at the end of the..." &&  dropdownValue != null) {
      route = "/balanceForecast";
      int days = convertDropDownValueToDays(dropdownValue);
      await pythonApi.getTransactionData(user.uid);
      await pythonApi.getBalanceData(user.uid);

        Database(uid: user.uid).uploadMessage(
            "One moment please.", false, "ChatBot", true);

        Future.delayed(Duration(seconds: 4), () {
          Map<String, dynamic> jsonifiedTransactions = {
            "ds": pythonApi.dates,
            "y": pythonApi.amounts
          };
          if(pythonApi.dates.isEmpty)
            sendFeatureUnavailMsg(user);
          else {
            pythonApi.balanceForecastReply(
                jsonifiedTransactions, pythonApi.balance, days, user.uid, route)
                .then((response) {
              print("Balance forecast response");
              Map<String, dynamic> data = json.decode(response);
              print(data);
              Database(uid: user.uid).uploadMessage(
                  data["message"], false, "ChatBot", true);
            });
          }
        });

    }
    else if (message == "What is my total income this..." && dropdownValue != null) {
      if(pythonApi.dates.isEmpty)
        sendFeatureUnavailMsg(user);
      else {

      }
    }
  }

  void goalBased(String message, BuildContext context, double savingAmount, DateTime goalDate) {
    final user = Provider.of<SimpleUser>(context, listen: false);
    Database(uid: user.uid).uploadMessage(message, true, user.firstName, true);
    goalBasedReply(message, savingAmount, goalDate, context);
  }
  Future<void> goalBasedReply(String message, double savingAmount, DateTime goalDate, BuildContext context) async {
    var route;
    final user = Provider.of<SimpleUser>(context, listen: false);


    if (message == "Am I on track in achieving my spending goal?" &&  savingAmount != null && goalDate != null) {
      route = "/goalTracking";
      await pythonApi.getTransactionData(user.uid);
      await pythonApi.getBalanceData(user.uid);

        Future.delayed(Duration(seconds: 2), () {
          Map<String, dynamic> jsonifiedTransactions = {
            "ds": pythonApi.dates,
            "y": pythonApi.amounts
          };
          if(pythonApi.dates.isEmpty)
            sendFeatureUnavailMsg(user);
          else {
            pythonApi.goalTrackingReply(
                jsonifiedTransactions, pythonApi.balance, savingAmount,
                goalDate,
                user.uid, route).then((response) {
              print("Goal based response");
              Map<String, dynamic> data = json.decode(response.body);

              Database(uid: user.uid).uploadMessage(
                  data["message"], false, "ChatBot", true);
            });
          }
        });
      }
    }


  int convertDropDownValueToDays(String dropdownValue) {
    int days;
    if (dropdownValue == "Week") {
      days = 7;
    } else if (dropdownValue == "Month") {
      days = 30;
    } else if (dropdownValue == "Year") {
      days = 365;
    }
    return days;
  }
  Future<File> byteImagetoImage(List<dynamic> data) async {
    data = data.map((s) => s as int).toList();
    final bytes = Uint8List.fromList(data);
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    return await File(tempPath+"temp.png").writeAsBytes(bytes);
  }

  void sendFeatureUnavailMsg(SimpleUser user) {
    Database(uid: user.uid).uploadMessage("This feature is not currently available. Please try adding transactions to use this feature.", false, "ChatBot", true);
  }


}
