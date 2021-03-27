import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenItemPage extends StatefulWidget {
  @override
  _OpenItemPageState createState() => _OpenItemPageState();
}

class _OpenItemPageState extends State<OpenItemPage> {
  List<int> money = [
    23,
    544,
    765,
    76,
  ];
  List from = [
    "Food",
    "Fruit",
    "Cinema",
    "Aliexpress",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              Modular.to.pushNamed('wallet/edit-item');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              print("More Button Pressed");
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
            Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Florenti Restau.',
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffeeeeee),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '\$245.29',
                          style: GoogleFonts.montserrat(
                            fontSize: 17.33,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffeeeeee).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '24 Feb',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 17.33,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffeeeeee),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '9:00 PM',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 10.67,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffeeeeee).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                              Items(money[index], from[index]),
                          itemCount: money.length,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Pay via Payooner Pressed");
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          height: 71.34,
                          color: const Color(0xff152e3e),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff315fd6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "Payooner",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 8.3,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'via Payoneer',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      Text(
                                        '13 Feb, 2018',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: const Color(0xff7099b2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 24, 25, 24),
                        height: 96,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Fees',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee).withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  'Total',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '\$25.29',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee).withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  '\$245.29',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ],
                            )
                          ],
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
    );
  }
}

class Items extends StatelessWidget {
  final int money;
  final String from;
  Items(this.money, this.from);
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
                      Container(
                        child: Text(
                          '-\$' + money.toString(),
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                            fontSize: 14.67,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffdd5757),
                          ),
                        ),
                      )
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
