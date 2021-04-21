import 'dart:convert';

import 'package:cache/app/modules/database/transaction.dart';
import 'package:cache/app/modules/user/cacheuser.dart';
import 'package:cache/app/modules/database/messages.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:cache/app/modules/wallet/chatbot/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

// Add/Delete/update/Get collections: https://medium.com/flutterdevs/using-firebase-firestore-in-flutter-b0ea2c62bc7
// sub Collections: https://medium.com/flutterdevs/firestore-subcollections-in-flutter-b717c193a13a

class Database {
  final String uid;

  // COLLECTION REFERENCES
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  final CollectionReference transactionsCollection =
      FirebaseFirestore.instance.collection('Transactions');

  Database({this.uid});
  
  
  Future<void> addUserToDatabase(String email, String firstName, String lastName) async {
    return await userCollection.doc(uid).set({
      'uid': this.uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'registerDate': DateTime.now(),
      'dateOfBirth': DateTime.utc(1998, 12, 2),
    });
  }

  
  Future<void> uploadTransactionsCSV(Map allTransactionsJSON) async {
    
    // INCOME
    List<dynamic> incomes = allTransactionsJSON["income"];
    incomes.forEach((transaction) async {
      await transactionsCollection.doc(uid).collection("user_income").add({
        'description': transaction["Store_or_Item"],
        'transactionDate':
            new DateFormat("yyyy-MM-dd").parse(transaction["Date"]),
        'amount': transaction["Credit"],
      });
    });

    // EXPENSE
    List<dynamic> expenses = allTransactionsJSON["expense"];
    expenses.forEach((transaction) async {
      await transactionsCollection.doc(uid).collection("user_expense").add({
        'description': transaction["Store_or_Item"],
        'transactionDate':
            new DateFormat("yyyy-MM-dd").parse(transaction["Date"]),
        'amount': transaction["Debit"],
      });
    });
    
    // META DATA
    List<dynamic> metaData = allTransactionsJSON["User_info"];
    metaData.forEach((metaData) async {
      await transactionsCollection.doc(uid).set({
        'Balance': metaData["balance"],
        'Latest_Date': metaData["latest_date"],
      });
    });

  }
  
  
  // Upload one transaction document
  Future<void> uploadSingleTransaction() async {
    
  }

  // USER DETAILS
  SimpleUser _getUserData(DocumentSnapshot snapshot){
    return SimpleUser(
      uid: snapshot.data()["uid"],
      firstName: snapshot.data()["firstName"],
      lastName: snapshot.data()["lastName"],
      email: snapshot.data()["email"],
    );
  }
  Stream<SimpleUser> getUserData(String uid){

    return userCollection.doc(uid).snapshots().map(_getUserData);
  }



  // INCOMES
  List<UserTransaction> _allIncomeFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserTransaction(
        transactionID: doc.id,
        description: doc.data()["description"],
        transactionDate: DateFormat("yyyy-MM-dd")
            .parse(doc.data()["transactionDate"].toDate().toString()),
        transactionAmount: doc.data()["amount"],
        transactionType: "income",
      );
    }).toList();
  }
  Stream<List<UserTransaction>> getIncomeSnapshot() {
    CollectionReference incomeCollection =
        FirebaseFirestore.instance.collection('Transactions/$uid/user_income');
    return incomeCollection
        .orderBy("transactionDate", descending: true)
        .limit(20)
        .snapshots()
        .map(_allIncomeFromSnapshot);
  }

  
  // EXPENSE
  List<UserTransaction> _allExpenseFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserTransaction(
        transactionID: doc.id,
        description: doc.data()["description"],
        transactionDate: DateFormat("yyyy-MM-dd")
            .parse(doc.data()["transactionDate"].toDate().toString()),
        transactionAmount: doc.data()["amount"],
        transactionType: "expense",
      );
    }).toList();
  }
  Stream<List<UserTransaction>> getExpenseSnapshot() {
    CollectionReference expenseCollection =
        FirebaseFirestore.instance.collection('Transactions/$uid/user_expense');
    return expenseCollection
        .orderBy("transactionDate", descending: true)
        .limit(20)
        .snapshots()
        .map(_allExpenseFromSnapshot);
  }

  // TRANSACTION INFORMATION
  Map<String,String> _userTransactionInfoSnapshot(DocumentSnapshot snapshot) {
    Map<String, String> userInfo = {"Balance": snapshot.data()["balance"],};

    return userInfo;

  }
  Stream<Map<String,String>> getUserTransactionInfo() {
    return transactionsCollection
        .doc(uid)
        .snapshots()
        .map(_userTransactionInfoSnapshot);
  }

  // UPLOAD MESSAGE
  Future<void> uploadMessage(
      String message, bool userMessage, String senderName) async {
    CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection('Messages/$uid/ChatMessages');

    // create a document with a timestamp id

    DocumentReference documentReference = messagesCollection
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, {
        "timestamp": DateTime.now(),
        "userMessage": userMessage,
        "senderName": senderName,
        "message": message,
      });
    });
  }

  // CHATBOT MESSAGES
  List<Messages> _allMessagesWithChatBot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
     return  Messages(
         messageTime:doc.data()["messageTime"],
       message:doc.data()["message"],
       userMessage:doc.data()["userMessage"],
       senderName:doc.data()["senderName"],
     );
    }).toList();
  }
  Stream<List<Messages>> getAllMessagesWithChatBot() {
    CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection("Messages/$uid/ChatMessages");
    return messagesCollection
        .orderBy("timestamp", descending: true)
        .limit(20)
        .snapshots()
        .map(_allMessagesWithChatBot);
  }
}
