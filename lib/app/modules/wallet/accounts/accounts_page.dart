import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  String username = "Jordan Lane";
  String date = "21 Feb";

  List<int> money = [
    23,
    544,
    765,
    76,
    54,
    65,
    34,
    6745,
    234,
    564,
    34,
    6745,
    234,
  ];
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
    "Paypal",
    "Amazon",
    "Credit",
    "CheapEverything",
  ];
  int selectedTab = 4;
  int tabcount = 5;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xff386785);
  Color button2 = Colors.white;
  Color button3 = const Color(0xff386785);
  Color button4 = const Color(0xffe3a33d);

  String dropdownValue = "Day";

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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
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
      body: //scaffold's body
          SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/profilephoto.png")))),
                      Container(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              username,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffeeeeee),
                              ),
                            ),
                          ),
                          Container(
                            width: 96,
                            height: 17.666667938232422,
                            child: Text(
                              'Today, 21 Jan',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff).withOpacity(0.5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('user/settings');
                    },
                    child: Icon(
                      Icons.settings,
                      color: const Color(0xff7099b2),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 26.7,
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
                height: 296.67,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Accounts',
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
                                  color: const Color(0xff0e2737),
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
                      ),
                      Container(
                        height: 18,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.25),
                              blurRadius:
                                  15.0, // has the effect of softening the shadow
                              spreadRadius:
                                  0.5, // has the effect of extending the shadow
                              offset: Offset(
                                10.0, // horizontal, move right 10
                                10.0, // vertical, move down 10
                              ),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          reverse: false,
                          itemBuilder: (_, int index) =>
                              BankCardListUp(money[index], from[index]),
                          itemCount: money.length,
                        ),
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
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                child: Text(
                                  'Extensions',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 25),
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          itemBuilder: (_, int index) =>
                              Extentions(money[index], from[index]),
                          itemCount: money.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                      Modular.to.pushReplacementNamed("/wallet/shopping-list");
                    },
                    child: Container(
                      width: 66,
                      child: SvgPicture.asset(
                        "assets/Pulse_machine.svg",
                        color: button3,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedTab = 4;
                      changepage();
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
      ),
    );
  }
}

class BankCardListUp extends StatelessWidget {
  final int money;
  final String from;
  BankCardListUp(this.money, this.from);
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
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 25,
                right: 25,
                top: 100,
                bottom: 25,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff3a422).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Positioned(
                left: 15,
                right: 15,
                top: 100,
                bottom: 30,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff3a422).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff3a422),
                      borderRadius: BorderRadius.circular(15)),
                  width: 302,
                  height: 160,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.credit_card,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 43,
                              child: Text(
                                '\$',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                money.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 42.67,
                                  fontWeight: FontWeight.w100,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: Text(
                                "." + money.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w200,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              from,
                              style: GoogleFonts.montserrat(
                                fontSize: 10.67,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 54.33333206176758,
                                child: Text(
                                  '1234',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                width: 45.33333206176758,
                                child: Text(
                                  '****',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                width: 45.33333206176758,
                                child: Text(
                                  '****',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                width: 59.33333206176758,
                                child: Text(
                                  '3756',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Extentions extends StatelessWidget {
  final int money;
  final String from;
  Extentions(this.money, this.from);
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
                              "\$" + money.toString() + "/ Month",
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
