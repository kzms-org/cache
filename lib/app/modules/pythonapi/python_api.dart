import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:multipart_request/multipart_request.dart' as multipartRequest;


class PythonApi {
  String apiURL = "cacheflask.herokuapp.com";

  Future<dynamic> getData(String route, dynamic data) async {
    final response = await http.get(Uri.https(apiURL, route));
  }

  Future<dynamic> sendDataUsingPostRequest(String route, dynamic data) async {
    return await http.post(
      Uri.https(apiURL, route),
      headers: <String, String>{
        'Content-Type': 'csv; charset=UTF-8',
      },
      body: '',
    ).then((value) => print(value.body));
  }

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
}