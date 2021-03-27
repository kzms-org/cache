import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class EditItemPage extends StatefulWidget {
  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  List products = [
    "headphones",
    "smarthpone",
    "cheap iphone",
    "cool sunglasses",
  ];

  List userNames = [
    "Adam",
    "Tony",
    "Cansu",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              print("Okey Button Pressed");
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xff7099b2)),
          color: const Color(0xff7099b2),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: //scaffold's body
          SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                  child: TextField(
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffeeeeee),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'DATE',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff768b98),
                            ),
                          ),
                          Container(
                            height: 24,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '24 Feb',
                              style: GoogleFonts.montserrat(
                                fontSize: 13.33,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffeeeeee),
                              ),
                            ),
                          ),
                          Container(
                            height: 14,
                          ),
                          Container(
                            width: 125,
                            height: 1.25,
                            color: const Color(0xff0D202B),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'BUDGET',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff768b98),
                            ),
                          ),
                          Container(
                            height: 7,
                          ),
                          Container(
                            width: 125,
                            child: TextField(
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.33,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffeeeeee),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
                                  'Subtasks',
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
                        height: 10,
                      ),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 1),
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          itemBuilder: (_, int index) =>
                              Subtasks(products[index]),
                          itemCount: products.length,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Add Item Pressed");
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(28, 0, 18.3, 0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: const Color(0xff768b98),
                              ),
                              Container(
                                width: 14.7,
                              ),
                              Container(
                                child: Text(
                                  'Add new...',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff768b98),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 26.7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
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
                                  'Attachements',
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 60,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  reverse: false,
                                  itemBuilder: (_, int index) => Attachements(
                                    userNames[index],
                                  ),
                                  itemCount: userNames.length,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Add Attachements Pressed");
                              },
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff375f78),
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 50,
                                  height: 52,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.add,
                                      color: const Color(0xff1c3a4d),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 22,
            ),
            Container(
              width: 340,
              height: 47,
              decoration: BoxDecoration(
                color: const Color(0xffdf4141),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Delete item',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 13.67,
                    fontWeight: FontWeight.w600,
                    color: Color(0xfff6f6f6),
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
      /*bottomNavigationBar: Container(
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
                      child: Icon(
                        Icons.account_balance_wallet,
                        color: button0,
                        size: 35,
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
                      child: Icon(
                        Icons.view_carousel,
                        color: button1,
                        size: 35,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedTab = 2;
                      changepage();
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
                    },
                    child: Container(
                      width: 66,
                      child: Icon(
                        Icons.show_chart,
                        color: button3,
                        size: 35,
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
                      child: Icon(
                        Icons.credit_card,
                        color: button4,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),*/
    );
  }
}

class Attachements extends StatelessWidget {
  final String user;
  Attachements(this.user);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print(this.user);
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff375f78),
              borderRadius: BorderRadius.circular(15)),
          width: 50,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              (user[0]),
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xfff5a623),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Subtasks extends StatelessWidget {
  final String item;
  Subtasks(this.item);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print(this.item);
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: 22,
          child: Container(
            padding: EdgeInsets.fromLTRB(33, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 6,
                          width: 6,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Container(
                          width: 18.7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                item,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.67,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffeeeeee),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
