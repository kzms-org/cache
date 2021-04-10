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
  final List<ChatMessage> _messages = <ChatMessage>[

    ChatMessage(type: true, name: "Anonymous", text: "Hi, this is Mohammed"),
    ChatMessage(type: false, name: "CacheBot", text: "Hello Mohammed, this is CacheBot"),
    ChatMessage(type: false, name: "CacheBot", text: "How may I help you today?"),
    ChatMessage(type: true, name: "Anonymous", text: "Tell me how much money I will spend next week?"),
  ];

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
                    FocusedMenuItem(
                        title: Text("Forecast", style:TextStyle(color: Colors.black)),
                        onPressed: () => modal.mainBottomSheet(context, questions["Forecast"])

                    ),
                    FocusedMenuItem(title: Text("Statistics", style:TextStyle(color: Colors.black)), onPressed: () => modal.mainBottomSheet(context, questions["Statistics"])),
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
            //Modular.to.pushNamed('/security/profile');
            print('sidebar');
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
      body: Column(children: <Widget>[
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.all(5.0),
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
            )
          ),
        ]),
      bottomNavigationBar: navBar(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String name;
  final bool type;

  ChatMessage({this.type, this.name, this.text});

  List<Widget> chatbotMessage(BuildContext context){
    return <Widget>[
      // for the avatar side
      Container(
        margin: const EdgeInsets.only(right: 10),
        child: CircleAvatar( child:  SvgPicture.asset("assets/chatbot.svg")),
      ),
      // For the name and the message side
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xffeeeeee),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:5.0),
              child: Text(this.text),
            )
          ],
        )
      ),
    ];
  }

  List<Widget> userMessage(BuildContext context){
    return <Widget>[

      // For the name and the message side
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                this.name,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffeeeeee),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:5.0),
                child: Text(this.text),
              )
            ],
          )
      ),
      // for the avatar side
      Container(
          width: 52.0,
          height: 52.0,
        margin: const EdgeInsets.only(left: 10),
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/profilephoto.png")))


      ),
    ];
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : chatbotMessage(context),
      )
    );
  }


}

