import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/database/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:multipart_request/multipart_request.dart' as multipartRequest;


class PythonApi {
  String apiURL = "cacheflask.herokuapp.com";

  List<String> dates = [];
  List<double> amounts = [];
  double balance = 0.0;
  bool check = true;

  // sample template
  Future<dynamic> getData(String route, dynamic data) async {
    final response = await http.get(Uri.https(apiURL, route));
  }
  // sample template
  Future<dynamic> sendDataUsingPostRequest(String route, dynamic data) async {
    return await http.post(
      Uri.https(apiURL, route),
      headers: <String, String>{
        'Content-Type': 'csv; charset=UTF-8',
      },
      body: '',
    ).then((value) => print(value.body));
  }
  // sample template
  Future<dynamic> getChatBotReply(String route, Map<String,List<String>> questionMap, int question) async{
    print(apiURL + " sending data here");

    // inset data into a variable
    Map<String, dynamic> data = {
      "questionMap": questionMap,
      "question": question,
    };

    // send data using post request
    Response response = await http.post(Uri.https(apiURL, route),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(data),
    );
    print("THIS IS CHATBOT REPLY YESS:"+response.body);
    return response.body;
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

  Future<Response> spendingForecastReply(Map<String, dynamic> jsonifiedTransactions, int days, String uid,String route) async {
    print("This is inside pythonapi");
    //send data to api
    var body = jsonEncode(<String, dynamic>{
      'days': days,
      "transactions":jsonifiedTransactions,
    });
    Response response = await sendingJsonApiPostRequest(body,route);

    print((response.body).runtimeType);
    Future.delayed(Duration(seconds: 2),() {dates.clear(); amounts.clear();});
    return response;
  }

  Future<dynamic>  goalTrackingReply() {

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

  Future<dynamic> financialAdviceReply() {

  }

}
