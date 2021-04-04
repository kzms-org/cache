import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/modals.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cache/play_ui/play_ui.dart';
import 'package:cache/play_ui/text_widget/text_widget.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:cache/play_ui/modal/modal.dart';


class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}



class _ChatbotPageState extends State<ChatbotPage> {

  Map<String,List<String>> questions = {
    "Forecast": [
      "Show me my forecast for the next week.",
      "How much will I have at the end of the month?"
    ],
    "Statistics": [
      "How much money am I spending on average.",
      "My income this month.",
      "My income this year.",
      "Show me the spending graph."
    ]
  };
  Modal modal = new Modal();


  // NavBar items START....................
  int selectedTab = 3;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xff386785);
  Color button2 = Colors.white;
  Color button3 = const Color(0xffe3a33d);
  Color button4 = const Color(0xff386785);

  // Gives color to specific icons in the navbar.
  void changepage() {
    //This bottombar is customized so we use a spesfic code for bottombar.
    if (selectedTab == 0) {
      setState(() {
        button0 = const Color(0xffe3a33d);
        button1 = const Color(0xff386785);
        button2 = Colors.white;
        button3 = const Color(0xff386785);
        button4 = const Color(0xff386785);
      });
      print("0");
    }
    if (selectedTab == 1) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xffe3a33d);
        button2 = Colors.white;
        button3 = const Color(0xff386785);
        button4 = const Color(0xff386785);
      });
      print("1");
    }
    if (selectedTab == 2) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xff386785);
        button2 = const Color(0xffe3a33d);
        button3 = const Color(0xff386785);
        button4 = const Color(0xff386785);
      });
      print("2");
    }
    if (selectedTab == 3) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xff386785);
        button2 = Colors.white;
        button3 = const Color(0xffe3a33d);
        button4 = const Color(0xff386785);
      });
      print("3");
    }
    if (selectedTab == 4) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xff386785);
        button2 = Colors.white;
        button3 = const Color(0xff386785);
        button4 = const Color(0xffe3a33d);
      });
      print("4");
    }
  }

  Widget navBar() {
    return Container(
      color: const Color(0xff1b394c),
      child: SafeArea(
        child: Container(
          height: 66.5,
          decoration: BoxDecoration(
            color: const Color(0xff1b394c),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.25),
                blurRadius: 15.0, // has the effect of softening the shadow
                spreadRadius: 0.5, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    selectedTab = 0;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/Wallet.svg",
                      color: button0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedTab = 1;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet/records");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/Horizontal_view.svg",
                      color: button1,
                    ),
                  ),
                ),
                FocusedMenuHolder(
                  menuWidth: MediaQuery.of(context).size.width*0.50,
                  blurSize: 5.0,
                  menuItemExtent: 45,
                  menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  duration: Duration(milliseconds: 100),
                  animateMenuItems: true,
                  blurBackgroundColor: Colors.black54,
                  bottomOffsetHeight: 100,
                  openWithTap: true,
                  menuItems: <FocusedMenuItem>[
                    FocusedMenuItem(title: Text("Forecast"), onPressed: () => modal.mainBottomSheet(context, questions["Forecast"])),
                    FocusedMenuItem(title: Text("Statistics"), onPressed: () => modal.mainBottomSheet(context, questions["Statistics"])),
                  ],
                  onPressed: (){},
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.5),
                          blurRadius:
                              15.0, // has the effect of softening the shadow
                          spreadRadius:
                              0.5, // has the effect of extending the shadow
                          offset: Offset(
                            0.0, // horizontal, move right 10
                            0.0, // vertical, move down 10
                          ),
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: const Color(0xff315fd6),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Ask',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffeeeeee),
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedTab = 3;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet/chatbot");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/chatbot.svg",
                      color: button3,
                      height:48,
                      width: 48,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedTab = 4;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet/accounts");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/Credit_card.svg",
                      color: button4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // NavBar items END......................

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.dehaze, color: const Color(0xff7099b2)),
          color: const Color(0xff7099b2),
          onPressed: () {
            Modular.to.pushNamed('/security/profile');
          },
        ),
        elevation: 0,
        title: Text(
          'CacheBot',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffeeeeee),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[]),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
