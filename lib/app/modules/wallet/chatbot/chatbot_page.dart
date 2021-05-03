import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/database/messages.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:cache/app/modules/wallet/chatbot/chat_message.dart';
import 'package:cache/app/modules/wallet/chatbot/chatbot_controller.dart';
import 'package:cache/app/modules/wallet/chatbot/dropdown_builder.dart';
import 'package:cache/play_ui/hex_color/hex_color.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  ChatBotController chatBotController = Modular.get<ChatBotController>();

  // NavBar items START....................
  int selectedTab = 3;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xff386785);
  Color button2 = Colors.white;
  Color button3 = const Color(0xffe3a33d);
  Color button4 = const Color(0xff386785);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SimpleUser>(context);

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
      body: SingleChildScrollView(
          reverse: true,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              verticalDirection: VerticalDirection.up,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                StreamBuilder(
                    stream: Database(uid: user.uid).getAllMessagesWithChatBot(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Messages> messages = snapshot.data;
                        return ListView.builder(
                          physics: ScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (_, int index) => ChatMessage(
                              type: messages[index].userMessage,
                              name: messages[index].senderName,
                              text: messages[index].message),
                          itemCount: messages.length,
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ])),
      bottomNavigationBar: navBar(),
    );
  }

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
                    Modular.to.pushReplacementNamed("/wallet/dashboard");
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
                  menuWidth: MediaQuery.of(context).size.width * 0.50,
                  blurSize: 5.0,
                  menuItemExtent: 45,
                  menuBoxDecoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  duration: Duration(milliseconds: 100),
                  animateMenuItems: true,
                  blurBackgroundColor: Colors.black54,
                  bottomOffsetHeight: 100,
                  openWithTap: true,
                  menuItems: <FocusedMenuItem>[
                    FocusedMenuItem(
                            title: Text("Forecast",
                            style: TextStyle(color: Colors.black)),
                            onPressed: () => mainBottomSheet(context, chatBotController.questions["Forecast"], "Forecast")),
                    FocusedMenuItem(
                            title: Text("Statistics",
                            style: TextStyle(color: Colors.black)),
                            onPressed: () => mainBottomSheet(context, chatBotController.questions["Statistics"], "Statistics")),
                  ],
                  onPressed: () {},
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
                      height: 48,
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

  mainBottomSheet(BuildContext context, Map<String,List<String>> data,String type) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: getWidgetList( context,  data, type),
          );
        });
  }
  List<Widget> getWidgetList(BuildContext context, Map<String,List<String>> data,String type){
    List<Widget> widgetList = <Widget>[];
    if(type=="Forecast"){

      widgetList.add(createTileTimeBased( context,  "How much will I most likely spend next...",  Icons.message));
      widgetList.add(createTileTimeBased( context,  "Tell me my balance at the end of the...",  Icons.message));
      for (var j in data["goal-based-question"])
        widgetList.add(_createTileGoalBased(context, j.toString(), Icons.emoji_events));
      for (var k in data["generic-question"])
        widgetList.add(_createTileGeneric(context, k.toString(), Icons.insights));

    }else if(type == "Statistics"){

      widgetList.add(createTileTimeBased( context,  "What is my average spending this...",  Icons.message));
      widgetList.add(createTileTimeBased( context,  "What is my total income this...",  Icons.message));
      for (var j in data["goal-based-question"])
        widgetList.add(_createTileGoalBased(context, j.toString(), Icons.emoji_events));
      for (var k in data["generic-question"])
        widgetList.add(_createTileGeneric(context, k.toString(), Icons.insights));

    }

    return  widgetList;
  }
  Widget createTileTimeBased(BuildContext context, String text, IconData icon) {
    DropdownBuilder myDropDown = DropdownBuilder(message: text);

    return GestureDetector(
      onTap: () async {
        print("SpendingForecast");

        chatBotController.uploadUserMessageTimeBased(text,context , "Week");
        Navigator.pop(context);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            questionWidget(icon, text),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    transform:
                    Matrix4.translationValues(-10, 0, 0.0),
                    child:
                    Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: myDropDown

                      ),
                    ),
                  ),
                ],
              ),
            ),

          ]),
    );
  }


  // change stuff so that when clicked shows 2 text field popup
  Widget _createTileGoalBased(BuildContext context, String text, IconData icon) {
    final format = DateFormat("yyyy-MM-dd");
    double savingAmount;
    DateTime goalDate;
    return GestureDetector(
      onTap: (){
        print("inside goal based tile");
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                backgroundColor: Color(0xff1b394c),

                content: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Form(

                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText:"How much do you want to save?",
                            labelStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),


                          ),
                          keyboardType: TextInputType.number,
                          style:GoogleFonts.montserrat(color: Colors.white) ,
                          onChanged: (String val){
                            savingAmount = double.parse(val);
                          },
                        ),
                        DateTimeField(
                          format: format,
                          decoration: InputDecoration(
                            labelText: "Goal Date",
                            labelStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),

                          ),
                          style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),

                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100),);
                            return date;

                          },
                          onChanged:(DateTime currentValue){
                            goalDate = currentValue;
                          }
                        ),



                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(primary: Color(0xff315fd6)),
                      onPressed: () {
                        // your code
                        print("submit pressed");
                        chatBotController.uploadUserMessageGoalBased( text, context,savingAmount,goalDate );
                        Navigator.pop(context);
                      })
                ],
              );
            });

        },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            questionWidget(icon, text),
          ]),
    );
  }

  Widget _createTileGeneric(BuildContext context, String text, IconData icon) {

    return GestureDetector(
      onTap: (){
        print("inside Generic tile");
        Navigator.pop(context);

        chatBotController.uploadUserMessage(text, context);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            questionWidget(icon, text),
          ]),
    );
  }



}
Widget questionWidget(IconData icon, String text){
  return Expanded(
    child: ListTile(
      dense: true,
      leading: Icon(icon),
      minLeadingWidth: 10,
      tileColor: Colors.white,
      title: Text(
        text,
        style: GoogleFonts.montserrat(color: Colors.black, fontSize: 14,),
      ),

    ),
  );
}



