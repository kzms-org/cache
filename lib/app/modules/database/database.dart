import 'dart:convert';


import 'package:cache/app/modules/user/cacheuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;

// Add/Delete/update/Get collections: https://medium.com/flutterdevs/using-firebase-firestore-in-flutter-b0ea2c62bc7
// sub Collections: https://medium.com/flutterdevs/firestore-subcollections-in-flutter-b717c193a13a

class Database {
  final String uid;

  Map allTransactionsJSON = {
    "transactions":[
      {
        "description": "MIHOYO1",
        "TransactionType": "Credit Card1",
        "transactionsCategory": "Gaming1",
        "amount": 1345.23
      },
      {
        "description": "MIHOYO2",
        "TransactionType": "Credit Card2",
        "transactionsCategory": "Gaming2",
        "amount": 2345.23
      },
      {
        "description": "MIHOYO3",
        "TransactionType": "Credit Card3",
        "transactionsCategory": "Gaming3",
        "amount": 3345.23
      }
    ]
  };



  // Get references to collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  final CollectionReference transactionsCollection =
      FirebaseFirestore.instance.collection('Transactions');
  final CollectionReference accountsCollection =
      FirebaseFirestore.instance.collection('Accounts');
  final CollectionReference chatbotCollection =
      FirebaseFirestore.instance.collection('ChatBot');


  Database({this.uid});

  // Add user information to database
  Future<void> addUserToDatabase(String email, String username) async{
    print("in addUserToDataBase");
    return await userCollection.doc(uid).set({
      'uid': this.uid,
     'name': username,
     'email': email,
     'username': username,
     'registerDate': DateTime.now(),
     'firstName':"Abdur Rahman",
     'lastName': "Mohammed",
     'dateOfBirth':DateTime.utc(1998,12,2),
    });
  }

  // iterate through json

  // Upload transactions CSV file
  Future<void> uploadTransactionsCSV() async {
    //Map allTransactions = jsonDecode(allTransactionsJSON);
    List<dynamic> ransactions = allTransactionsJSON["transactions"];
    ransactions.forEach((transaction) async {
      await transactionsCollection.
      doc(uid).
      collection("user_transactions").
      add({
        'description': transaction["description"],
        'transactionType': transaction["TransactionType"],
        'transactionCategory': transaction["transactionsCategory"],
        'amount': transaction["amount"],
      });
    });
  }

  // Upload one transaction document
  Future<void> uploadTransaction(String) async {

    await transactionsCollection.
    doc(uid).
    collection("user_transactions").
    add({
      'transactionID': "",
      'description': "",
      'transactionType': "",
      'transactionCategory': "",
      'amount': "",

    });

  }




}