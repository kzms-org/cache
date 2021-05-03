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
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: this.type? BorderRadius.only(topRight: Radius.circular(2),topLeft: Radius.circular(10), bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)): BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(2), bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
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

          )
        );
  }
}