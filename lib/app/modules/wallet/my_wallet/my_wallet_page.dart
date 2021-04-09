import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cache/play_ui/easy_widgets/easy_widgets.dart';

class MyWalletPage extends StatefulWidget {
  @override
  _MyWalletPageState createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  double notificationOpacity = 1;
  bool notification = false;
  String date = returnDate();
  String totalMoney1 = "6791";
  String totalMoney2 = ".90";
  String lastWeekComp = "+25% ";

  int selectedTab = 0;
  int tabcount = 5;
  Color button0 = const Color(0xffe3a33d);
  Color button1 = const Color(0xff386785);
  Color button2 = Colors.white;
  Color button3 = const Color(0xff386785);
  Color button4 = const Color(0xff386785);

  String dropdownValue = "Day";

  void changepage() {
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

  Widget navBar(){
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
                GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed("wallet/add-funds");
                  },
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
                    child: Icon(Icons.add, color: button2),
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

  Widget returnRiyalSVG(){
    return Container(
      width: 23.33333396911621,
      height: 42.66666793823242,
      child: SvgPicture.asset(
        'assets/riyal.svg',
        color: Colors.white60,
        height: 50,
        width: 50,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        actions: <Widget>[
          Column(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(10, 19, 0.0),
                height: 5,
                width: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.red.withOpacity(notificationOpacity),
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.notifications, color: const Color(0xff7099b2)),
              //   color: const Color(0xff7099b2),
              //   onPressed: () {
              //     print("Notifications Button Pressed");
              //     setState(() {
              //       if (notification == true) {
              //         notificationOpacity = 1;
              //         notification = false;
              //       } else {
              //         notificationOpacity = 0;
              //         notification = true;
              //       }
              //     });
              //   },
              // ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.search, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              print("Search Button Pressed");
            },
          ),
        ],
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
          'Dashboard',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffeeeeee),
          ),
        ),
        centerTitle: true,
      ),

      body: //scaffold's body
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        blurRadius:
                            15.0, // has the effect of softening the shadow
                        spreadRadius:
                            0.5, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      ),
                    ],
                    color: const Color(0xff315fd6),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                height: 200,
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Balance',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Text(
                                'Today, ' + date,
                                style: GoogleFonts.montserrat(
                                  fontSize: 11.33,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffeeeeee).withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print("add button pressed");
                            },
                            child: Container(
                              width: 78,
                              height: 33,
                              decoration: BoxDecoration(
                                color: Color(0xff0e2737).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    child: Text(
                                      'Add',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.67,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          returnRiyalSVG(),
                          Text(
                            totalMoney1,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w200,
                              fontSize: 73.33,
                              color: Color(0xffffffff),
                            ),
                          ),
                          Container(
                            height: 42.66666793823242,
                            child: Text(
                              totalMoney2,
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                color: Color(0xffeeeeee).withOpacity(0.75),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 36,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        blurRadius:
                            15.0, // has the effect of softening the shadow
                        spreadRadius:
                            0.5, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      ),
                    ],
                    color: const Color(0xff1c3a4d),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                height: 305.33,
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Activity',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Text(
                                'Today, ' + date,
                                style: GoogleFonts.montserrat(
                                  fontSize: 11.33,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffeeeeee).withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 114,
                            height: 33,
                            decoration: BoxDecoration(
                              color: const Color(0xff0e2737),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  transform:
                                      Matrix4.translationValues(15, 0, 0.0),
                                  child: Text(
                                    dropdownValue,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.67,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  transform:
                                      Matrix4.translationValues(-10, 0, 0.0),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor: const Color(0xff0e2737),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: <String>[
                                          'Day',
                                          'Week',
                                          'Mount',
                                          'Year'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            print(newValue);
                                            dropdownValue = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 159,
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 33,
                                    width: 33,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff7099B2),
                                      child: Container(
                                        height: 29,
                                        width: 29,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0xff1c3a4d),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 60.33333206176758,
                                        child: Text(
                                          'Expn.',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 83,
                                        child: Text(
                                          '+23% Cmpr.',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee)
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: const Color(0xff0d2839),
                                width: 2,
                                height: 40,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 33,
                                    width: 33,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff7099B2),
                                      child: Container(
                                        height: 29,
                                        width: 29,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0xff1c3a4d),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 60.33333206176758,
                                        child: Text(
                                          'Earn.',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 83,
                                        child: Text(
                                          '+63% Cmpr.',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee)
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }
}

