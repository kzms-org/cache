
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;



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
     'name': username,
     'email': email,
     'username': username,
     'registerDate': DateTime.now(),
    });
  }

  // Upload transactions
  Future<void> uploadTransactions() async {
    // return await transactionsCollection.doc(uid).set({
    //   'transactionID': ,
    // });
  }

}