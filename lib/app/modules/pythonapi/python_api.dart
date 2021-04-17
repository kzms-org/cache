import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PythonApi {
  String apiURL = "cacheflask.herokuapp.com";

  Future<dynamic> getData(String route, dynamic data) async {
    print(apiURL+ " sending  data here");
    final response =  await http.get(Uri.https(apiURL,route));

    print(response.body);
  }

  Future<dynamic> sendDataUsingPostRequest(String route, dynamic data) async {
    print(apiURL+ " sending data here");
    return await http.post(
      Uri.https(apiURL, route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: '',
    ).then((value) => print(value.body));
  }

}