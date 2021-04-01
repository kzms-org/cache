import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cache/play_ui/button/button_widget.dart';
import 'package:cache/play_ui/play_ui.dart';
import 'package:cache/play_ui/text_widget/text_widget.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() =>
      _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {


  Widget createLogo(Widget logo) {
    return Container(
      child: logo,
    );
  }

  Widget createTitle(String title) {
    return Container(
      width: 281,
      height: 45,
      child: TextWidget.title(
        title,
        fontSize: 40,
      ),
    );
  }

  Widget createDescription(String description) {
    return Container(
      width: 324,
      height: 72,
      child: TextWidget.subTitle(
        description,
        textAlign: TextAlign.center,
        fontSize: 17,
      ),
    );
  }

  Widget createHeader({Widget logo, String title, String description}) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
        ),
        createLogo(logo),
        Container(
          height: 18,
        ),
        createTitle(title),
        Container(
          height: 9,
        ),
        createDescription(description),
        Container(
          width: 33.33,
          height: 5.33,
          color: const Color(0xff86959C),
        )
      ],
    );
  }

  Widget createDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 141,
          height: 1,
          color: const Color(0xff23475d),
        ),
        Container(
          width: 29,
          child: Text(
            'OR',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 10.66,
              fontWeight: FontWeight.w600,
              color: Color(0xffeeeeee),
            ),
          ),
        ),
        Container(
          width: 141,
          height: 1,
          color: const Color(0xff23475d),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              print("Ad Button Pressed");
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.dehaze, color: const Color(0xff7099b2)),
          color: const Color(0xff7099b2),
          onPressed: () {
            Modular.to.pushNamed('/security/profile');
          },
        ),
        elevation: 0,
        title: Text(
          'Accounts',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffeeeeee),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(),
      bottomNavigationBar: Container(),
    );
  }
}
