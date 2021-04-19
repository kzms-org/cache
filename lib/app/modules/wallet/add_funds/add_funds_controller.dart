import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/pythonapi/python_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

part 'add_funds_controller.g.dart';

class AddFundsController = _AddFundsControllerBase with _$AddFundsController;

abstract class _AddFundsControllerBase with Store {
  PythonApi pythonApi = PythonApi();
  final user = FirebaseAuth.instance.currentUser;

  // uses filepicker class select a file from the device.
  Future SelectFileToUpload() async{
    FilePickerResult filePickerResult = await FilePicker.platform.pickFiles(type: FileType.custom,
    allowedExtensions: ['csv','jpg'],
    );

    if(filePickerResult != null){

      File  fileToUpload = File(filePickerResult.files.single.path);

      String dir = path.dirname(fileToUpload.path);
      String newPath = path.join(dir,"receiptReport.csv");
      fileToUpload.renameSync(newPath);


      // Send this file to the python script here
      final  result = await pythonApi.sendCSVFileUsingPostRequest("/csvPreProcessing",fileToUpload);
      print(result);
      // read the returned file and iterate through it all and add to collection
      await Database(uid: user.uid).uploadTransactionsCSV();


      String fileName = basename(fileToUpload.path);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(fileToUpload);
      TaskSnapshot taskSnapshot = uploadTask.snapshot;
      taskSnapshot.ref.getDownloadURL().then((value) => print("Done: $value"));

    }
  }
}
