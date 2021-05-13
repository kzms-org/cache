import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/database/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';


class PythonApi {
  String apiURL = "cacheflask.herokuapp.com";
  List<String> dates = [];
  List<double> amounts = [];
  double balance = 0.0;
  bool check = true;

  // common tasks
  Future<void> getTransactionData(String uid) async{
    Stream<List<UserTransaction>> userTransactions = Database(uid: uid.trim() ).getExpenseTrainingDataSnapshot();
    userTransactions.listen((data) =>
        data.forEach((element) {

          dates.add(element.transactionDate.toString());
          amounts.add( element.transactionAmount);
          return "success";
        }));

  }
  Future<void> getBalanceData(String uid) async{
    Stream<Map<String,dynamic>> userTransactions = Database(uid: uid.trim()).getUserTransactionInfo();
    userTransactions.listen((data) =>
    balance = data["Balance"]
    );

  }
  Future<dynamic> sendingJsonApiPostRequest(var body, String route) async{
    return await http.post(Uri.https(apiURL, route),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: body,
    );
  }

  // CSV UPLOAD
  Future<dynamic> sendCSVFileUsingPostRequest(String route, File data) async {
    print(apiURL + " sending data here");

    var request = http.MultipartRequest('POST', Uri.https(apiURL, route));
    request.files.add(
        await http.MultipartFile.fromPath(
            'file', data.path,
            contentType: MediaType('application', 'octet-stream'),
            filename: "receiptReport.csv"
        )

    );

    var response = await request.send();

    // two methods

    // method 1:
    //var responseString = await response.stream.bytesToString();

    // method 2:
    var responseString = await http.Response.fromStream(response);


    // if (response.statusCode == 200) print('Uploaded!');
    // if (response.statusCode == 400) print("wtf");


    return responseString.body;
  }

  // Questions
  Future<Response> spendingForecastReply(Map<String, dynamic> jsonifiedTransactions, int days, String uid,String route) async {
    print("This is inside pythonapi");
    //send data to api
    var body = jsonEncode(<String, dynamic>{
      'days': days,
      "transactions":jsonifiedTransactions,
    });
    Response response = await sendingJsonApiPostRequest(body,route);

    Future.delayed(Duration(seconds: 2),() {dates.clear(); amounts.clear();});
    return response;
  }
  Future<dynamic>  goalTrackingReply(Map<String, dynamic> jsonifiedTransactions, double balance, double savingAmount, DateTime goalDate, String uid, String route) async {
    String goalDateString = "${goalDate.year}-${goalDate.month}-${goalDate.day} ${goalDate.hour}:${goalDate.minute}:${goalDate.second}";
    var body = jsonEncode(<String, dynamic>{
      'balance': balance,
      'goalDate': goalDateString,
      'savingAmount': savingAmount,
      "transactions": jsonifiedTransactions,
    });

    Response response = await sendingJsonApiPostRequest(body,route);

    Future.delayed(Duration(seconds: 2),() {dates.clear(); amounts.clear();});
    return response;

  }
  Future<dynamic> balanceForecastReply(Map<String, dynamic> jsonifiedTransactions, double balance,int days, String uid,String route) async {
    print("This is inside pythonapi");
    //send data to api
    var body = jsonEncode(<String, dynamic>{
      'days': days,
      "balance":balance,
      "transactions":jsonifiedTransactions,
    });
    var response = await sendingJsonApiPostRequest(body,route);

    print(response.body);
    Future.delayed(Duration(seconds: 2),() {dates.clear(); amounts.clear();});
    return response.body;
  }
  Future<dynamic> financialAdviceReply(Map<String, dynamic> jsonifiedTransactions, String uid, String route) async {
    var body = jsonEncode(<String, dynamic>{
      "transactions": jsonifiedTransactions,
    });

    Response response = await sendingJsonApiPostRequest(body,route);

    Future.delayed(Duration(seconds: 2),() {dates.clear(); amounts.clear();});
    return response;
  }

}
