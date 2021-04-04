import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  List<int> money = [23, 544, 765, 76, 54, 65, 34, 6745, 234, 564];
  List from = [
    "Paypal",
    "Amazon",
    "CheapEverything",
    "Aliexpress",
    "Toyota",
    "USP",
    "Amazon",
    "Credit",
    "CheapEverything",
    "Paypal"
  ];
  int selectedTab = 1;
  int tabcount = 5;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xffe3a33d);
  Color button2 = Colors.white;
  Color button3 = const Color(0xff386785);
  Color button4 = const Color(0xff386785);

//This bottombar is customized so we use a spesfic code for bottombar.
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

  Widget navBar() {
    return  Container(
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

  Widget build(BuildContext context) {
    return DefaultTabController(
      // Tabbar'ımızın kaç elemanı olucak ?
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c3a4d),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: const Color(0xff7099b2)),
              color: const Color(0xff7099b2),
              onPressed: () {
                print("Ad Button Pressed");
              },
            ),
          ],
          title: Text(
            'Records',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffeeeeee),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.dehaze, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              Modular.to.pushNamed('/security/profile');
            },
          ),
          // elemanlarımızın iconları, isimleri vb.
          bottom: TabBar(
            unselectedLabelColor: const Color(0xffeeeeee).withOpacity(0.5),
            labelColor: Color(0xfff5a623),
            indicatorColor: Color(0xfff5a623),
            tabs: <Widget>[
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'EXPENSES',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 10.67,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'EARNINGS',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 10.67,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // TabBarView içerisine Tabbar içerisindeki elemanlarla
        // eşleşicek sayfaları ekliyoruz
        body: TabBarView(
          children: <Widget>[
            Page1(),
            Page2(),
          ],
        ),
        bottomNavigationBar: navBar(),
      ),
    );
  }
}

List<int> money = [23, 544, 765, 76, 54, 65, 34, 6745, 234, 564];
List from = [
  "Paypal",
  "Amazon",
  "CheapEverything",
  "Aliexpress",
  "Toyota",
  "USP",
  "Amazon",
  "Credit",
  "CheapEverything",
  "Paypal"
];

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff112a39),
        child: Center(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            scrollDirection: Axis.vertical,
            reverse: false,
            itemBuilder: (_, int index) => Expenses(money[index], from[index]),
            itemCount: money.length,
          ),
        ));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff112a39),
        child: Center(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            scrollDirection: Axis.vertical,
            reverse: false,
            itemBuilder: (_, int index) => Earns(money[index], from[index]),
            itemCount: money.length,
          ),
        ));
  }
}

class Expenses extends StatelessWidget {
  final int money;
  final String from;
  Expenses(this.money, this.from);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: GestureDetector(
        onTap: () {
          Modular.to.pushNamed('wallet/open-item');
        },
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            width: 136,
            height: 80,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff2a4f67),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '\$',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xfff5a623),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  from,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.67,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  from,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10.67,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff888888),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "-\$" + money.toString(),
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                fontSize: 14.67,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffdd5757),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '21 Feb, 2018',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                fontSize: 10.67,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff888888),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 14,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Container(
                        height: 1,
                        color: const Color(0xff23475d),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Earns extends StatelessWidget {
  final int money;
  final String from;
  Earns(this.money, this.from);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print("object");
        //Navigator.pushNamed(context, "sayfa.arasayfa.sohbet");
      },
      child: GestureDetector(
        onTap: () {
          print(this.from);
        },
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            width: 136,
            height: 80,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff2a4f67),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '\$',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xfff5a623),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  from,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.67,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  from,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10.67,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff888888),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "+\$" + money.toString(),
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                fontSize: 14.67,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff60ba67),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '21 Feb, 2018',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                fontSize: 10.67,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff888888),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 14,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Container(
                        height: 1,
                        color: const Color(0xff23475d),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
