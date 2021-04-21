import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String name;
  final bool type;

  ChatMessage({this.type, this.name, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: 10,
      ),

          child: Align(
            alignment:this.type ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width:250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: this.type ? Colors.blueGrey : Colors.blue,
              ),
              padding: EdgeInsets.all(10),
              child:Container(
                  child: Text(this.text,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: this.type ? Colors.white : Colors.white,
                        fontWeight: FontWeight.normal,

                      ))),
            ),
          )
        );
  }
}