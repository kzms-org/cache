import 'dart:convert';


import 'package:cache/app/modules/database/transaction.dart';
import 'package:cache/app/modules/user/cacheuser.dart';
import 'package:cache/app/modules/database/chatbot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
// Add/Delete/update/Get collections: https://medium.com/flutterdevs/using-firebase-firestore-in-flutter-b0ea2c62bc7
// sub Collections: https://medium.com/flutterdevs/firestore-subcollections-in-flutter-b717c193a13a

class Database {
  final String uid;


  // Get references to collections

  // user collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  // transactionsCollection
  final CollectionReference transactionsCollection =
      FirebaseFirestore.instance.collection('Transactions');



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


  // Upload transactions CSV file
  Future<void> uploadTransactionsCSV(Map allTransactionsJSON) async {
    //Map allTransactions = jsonDecode(allTransactionsJSON);


    // upload income
    List<dynamic> incomes = allTransactionsJSON["income"];
    incomes.forEach((transaction) async {
      await transactionsCollection.
      doc(uid).
      collection("user_income").
      add({
        'description': transaction["Store_or_Item"],

        'transactionDate': new DateFormat("yyyy-MM-dd").parse(transaction["Date"]),
        'amount': transaction["Credit"],
      });
    });

    // upload expense
    List<dynamic> expenses = allTransactionsJSON["expense"];
    expenses.forEach((transaction) async {
      await transactionsCollection.
      doc(uid).
      collection("user_expense").
      add({
        'description': transaction["Store_or_Item"],
        'transactionDate': new DateFormat("yyyy-MM-dd").parse(transaction["Date"]),
        'amount': transaction["Debit"],
      });
    });


  }

  // Upload one transaction document
  Future<void> uploadTransaction() async {

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

  // Retrieve Transactions of a user

  // INCOMES
  List<UserTransaction> _allIncomeFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot.docs.first.data()["transactionDate"].toDate().toString());
    return snapshot.docs.map((doc) {
      return UserTransaction(

        transactionID: doc.id,
        description: doc.data()["description"],
        transactionDate:  DateFormat("yyyy-MM-dd").parse(doc.data()["transactionDate"].toDate().toString()),
        transactionAmount: doc.data()["amount"],
        transactionType: "income",
      );
    }).toList();

  }

  Stream<List<UserTransaction>> getIncomeSnapshot() {
    CollectionReference incomeCollection = FirebaseFirestore.instance.collection('Transactions/$uid/user_income');
    return incomeCollection.orderBy("transactionDate").limit(20).snapshots().
    map(_allIncomeFromSnapshot);
  }

  // EXPENSE
  List<UserTransaction> _allExpenseFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.docs.map((doc) {
      return UserTransaction(

        transactionID: doc.id,
        description: doc.data()["description"],
        transactionDate:  DateFormat("yyyy-MM-dd").parse(doc.data()["transactionDate"].toDate().toString()),
        transactionAmount: doc.data()["amount"],
        transactionType: "expense",
      );
    }).toList();

  }
  // Retrieve Transactions of a user
  Stream<List<UserTransaction>> getExpenseSnapshot() {
    CollectionReference expenseCollection = FirebaseFirestore.instance.collection('Transactions/$uid/user_expense');
    return expenseCollection.orderBy("transactionDate").limit(20).snapshots().
    map(_allExpenseFromSnapshot);
  }
  
  Future<void> uploadMessage() {
    CollectionReference messagesCollection = FirebaseFirestore.instance.collection('Messages/$uid/ChatMessages');

    messagesCollection.add({

    });
  }
  // CHATBOT MESSAGES
  Stream<List<Messages>> getMessages() {

    return null;
  }

}