import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DropdownBuilder extends StatefulWidget {
  String message;
  DropdownBuilder({this.message});

  @override
  DropdownBuilderState createState() =>
      DropdownBuilderState();
}

class DropdownBuilderState extends State<DropdownBuilder> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    ChatBotController chatBotController = Modular.get<ChatBotController>();
    return DropdownButton<String>( // DropdownButtonHideUnderline
          value: dropdownValue == null? dropdownValue = "Week": dropdownValue,
          style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black,fontWeight: FontWeight.w500 ),
          items: <String>[
            'Week',
            'Month',
          ].map<DropdownMenuItem<String>>(
                  (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value+"?"),
                );
              }).toList(),
          onChanged: (String newValue) {
            dropdownValue = newValue;
            setState(() {
              dropdownValue;
            });

            chatBotController.timeBased(widget.message,context, dropdownValue);
            Navigator.pop(context);
          },
        );
  }
}