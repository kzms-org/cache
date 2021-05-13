import 'dart:convert';
import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/pythonapi/python_api.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
part 'add_funds_controller.g.dart';

class AddFundsController = _AddFundsControllerBase with _$AddFundsController;

abstract class _AddFundsControllerBase with Store {
  PythonApi pythonApi = Modular.get<PythonApi>();

  Future addIncome(double amount, DateTime date, String description, BuildContext context) async{
    final user = Provider.of<SimpleUser>(context, listen:false);
    await pythonApi.getBalanceData(user.uid);
    Future.delayed(Duration(seconds: 2), () {
      Database(uid: user.uid).addIncome(amount, date, description, pythonApi.balance);
    });

  }
  Future addExpense(double amount, DateTime date, String description, BuildContext context) async{
    final user = Provider.of<SimpleUser>(context, listen:false);
    await pythonApi.getBalanceData(user.uid);
    Future.delayed(Duration(seconds: 2), () {
      Database(uid: user.uid).addExpense(amount, date, description, pythonApi.balance);
    });

  }
  // uses filepicker class select a file from the device.
  Future selectFileToUpload(BuildContext context) async{
    final user = Provider.of<SimpleUser>(context, listen:false);
    // when user clicks on upload csv file open the file picker
    FilePickerResult filePickerResult = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['.csv'],
    );

    if(filePickerResult != null){

      // get the path to the file
      File  fileToUpload = File(filePickerResult.files.single.path);

      // Rename the file to receiptReport.csv
      String dir = path.dirname(fileToUpload.path);

      String newPath = path.join(dir,"receiptReport.csv");

      File renamedCSVFile = await File(fileToUpload.path).copy(newPath);
      print(renamedCSVFile.runtimeType);


      // Send this file to the python script here
      final  result = await pythonApi.sendCSVFileUsingPostRequest("/csvPreProcessing",renamedCSVFile);
      // read the json object with all transactions
      Map<String, dynamic> allTransactions = json.decode(result);
      print(allTransactions["expense"].last);
      // add to collection
      await Database(uid: user.uid).uploadTransactionsCSV(allTransactions);


    }
  }

  Future uploadFileToFirebaseStorage(BuildContext context) async{
    final user = Provider.of<SimpleUser>(context, listen:false);
    FilePickerResult filePickerResult = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['csv','jpg''.mp4'],
    );

    if(filePickerResult != null) {

      File fileToUpload = File(filePickerResult.files.single.path);

      String fileName = basename(fileToUpload.path);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
          'uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(fileToUpload);
      TaskSnapshot taskSnapshot = uploadTask.snapshot;
      taskSnapshot.ref.getDownloadURL().then((value) => print("Done: $value"));
    }
  }
}
