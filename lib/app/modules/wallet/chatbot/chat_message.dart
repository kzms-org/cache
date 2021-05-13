import 'package:cache/app/modules/wallet/full_photo/full_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ChatMessage extends StatelessWidget {
  final dynamic message;
  final String name;
  final bool type;
  final bool isText;


  ChatMessage({this.type, this.name, this.message, this.isText});

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
                    child: this.isText? textMessage():imageMessage()
                ),
              ),
            )

          )
        );
  }


  Widget textMessage(){
    return Text(this.message,
        overflow: TextOverflow.visible,
        style: GoogleFonts.montserrat(
          fontSize: 15,
          color: this.type ? Colors.white : Colors.white,
          fontWeight: FontWeight.normal,

        ));
  }

  Widget imageMessage(){

    // get the url in message, and download image from firestorage
    return GestureDetector(
      onTap: (){
        print("clicked image");
        var url = this.message;
        Modular.to.pushNamed("/wallet/full-photo",arguments: this.message);
        // MaterialPageRoute(builder: (context) => FullPhoto(url: this.message));
      },
      child: CachedNetworkImage(
        imageUrl: this.message,
        width: 200.0,
        height: 200.0,
        fit: BoxFit.cover,
        placeholder: (context, imageUrl) => Container(
          child: CircularProgressIndicator(),
          width: 200.0,
          height: 200.0,
          padding: EdgeInsets.all(70.0),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Material(
          child: Image.asset(
            'assets/img_not_available.jpeg',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          clipBehavior: Clip.hardEdge,
        ),

      ),
    );
  }
}