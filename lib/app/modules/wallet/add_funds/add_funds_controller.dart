import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

part 'add_funds_controller.g.dart';

class AddFundsController = _AddFundsControllerBase with _$AddFundsController;

abstract class _AddFundsControllerBase with Store {

  // uses filepicker class select a file from the device.
  Future SelectFileToUpload(){
    //FilePickerResult fileToUpload = await File
  }


  // Future uploadFile() async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   firebase_storage.Reference reference = firebase_storage.FirebaseStorage.instance.ref().child(fileName);
  //   StorageUploadTask uploadTask = reference.putFile(imageFile);
  //   StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
  //   storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
  //     imageUrl = downloadUrl;
  //     setState(() {
  //       isLoading = false;
  //       onSendMessage(imageUrl, 1);
  //     });
  //   }, onError: (err) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Fluttertoast.showToast(msg: 'This file is not an image');
  //   });
  // }
}
