import 'package:cache/app/modules/database/database.dart';
import 'package:cache/app/modules/database/transaction.dart';
import 'package:cache/app/modules/user/cacheuser.dart';
import 'package:cache/app/modules/wallet/records/earns.dart';
import 'package:cache/app/modules/wallet/records/expenses.dart';
import 'package:cache/app/modules/wallet/records/records_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecordsPage extends StatefulWidget {



  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  RecordsController recordsController = RecordsController();
  int selectedTab = 1;
  int tabcount = 5;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xffe3a33d);
  Color button2 = Colors.white;
  Color button3 = const Color(0xff386785);
  Color button4 = const Color(0xff386785);

//This bottombar is customized so we use a specific code for bottombar.
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
                    Modular.to.pushNamed("/wallet/add-funds");
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

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c3a4d),
          actions: <Widget>[],
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
              print('sidebar');
            },
          ),
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

class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CacheUser>(context);

    return Container(
        color: const Color(0xff112a39),
        child: Center(
            child: StreamBuilder<List<UserTransaction>>(
                stream: Database(uid: user.uid).getExpenseSnapshot(30),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<UserTransaction> expenses = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.only(bottom: 50),
                      scrollDirection: Axis.vertical,
                      reverse: false,
                      itemBuilder: (_, int index) => Expenses(
                          expenses[index].transactionAmount,
                          expenses[index].description,
                        expenses[index].transactionDate,),
                      itemCount: expenses.length,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CacheUser>(context);
    return Container(
        color: const Color(0xff112a39),
        child: Center(
            child: StreamBuilder<List<UserTransaction>>(
                stream: Database(uid: user.uid).getIncomeSnapshot(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<UserTransaction> incomes = snapshot.data;

                    return ListView.builder(
                      padding: EdgeInsets.only(bottom: 50),
                      scrollDirection: Axis.vertical,
                      reverse: false,
                      itemBuilder: (_, int index) => Earns(
                          incomes[index].transactionAmount,
                          incomes[index].description,
                          incomes[index].transactionDate,
                      ),

                      itemCount: incomes.length,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
