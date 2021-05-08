
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {

  static getTitleData(double maxValueX, double maxValueY, double minValueX, double minValueY) => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 10,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff68737d),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      getTitles: (value) {

        if(value.toInt() == 1){
          return "Jan";
        }else if(value.toInt() == 2){
          return "Feb";
        }else if(value.toInt() == 3){
          return "March";
        }else if(value.toInt() == 4){
          return "April";
        }else if(value.toInt() == 5){
          return "May";
        }else if(value.toInt() == 6){
          return "Jun";
        }else if(value.toInt() == 7){
          return "July";
        }else if(value.toInt() == 8){
          return "Aug";
        }else if(value.toInt() == 9){
          return "Sept";
        }else if(value.toInt() == 10){
          return "Oct";
        }else if(value.toInt() == 11){
          return "Nov";
        }else if(value.toInt() == 12){
          return "Dec";
        }
        return '';
      },
      margin: 8,
    ),
    leftTitles: SideTitles(
      showTitles: true,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xfffcfcfc),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      getTitles: (value) {
        switch (value.toInt()){
          case 1:
            return '10';
          case 2: return '20';
          case 4: return '50';
          case 6: return '100';

        }
        return '';
      },
      reservedSize: 0,
      margin: 10,
    ),
  );
}