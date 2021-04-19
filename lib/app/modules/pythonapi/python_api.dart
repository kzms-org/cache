import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
        'Content-Type': 'csv; charset=UTF-8',
      },
      body: '',
    ).then((value) => print(value.body));
  }

  Future<dynamic> sendCSVFileUsingPostRequest(String route, dynamic data) async {
    print(apiURL+ " sending data here");

    var request = http.MultipartRequest(
      "POST",Uri.https(apiURL, route),
    );
    Map<String, String> headers={
      "Content-type": "multipart/form-data"
    };

    request.files.add(
      http.MultipartFile(
        'file',
        data.readAsBytes().asStream(),
        data.lengthSync(),
        filename: "receiptReport.csv",
      ),
    );

    request.headers.addAll(headers);
    var result = await request.send();
    print(result.toString());
    return "works";
    // return await http.post(
    //   Uri.https(apiURL, route),
    //   headers: <String, String>{
    //     'Content-Type': 'csv; charset=UTF-8',
    //   },
    //   body: '',
    // ).then((value) => print(value.body));
  }

}