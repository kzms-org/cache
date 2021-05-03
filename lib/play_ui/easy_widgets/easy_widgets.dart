
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String returnDate(){
  DateTime now = new DateTime.now();
  String today = DateFormat('dd-MM-yy').format(now);
  return today;
}

