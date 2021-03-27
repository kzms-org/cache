import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List userNames = ["Adam", "Tony", "Cansu"];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xff7099b2)),
          color: const Color(0xff7099b2),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        elevation: 0,
        title: Text(
          'Activity',
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
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 0),
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemBuilder: (_, int index) =>
                            FromFriends(userNames[index]),
                        itemCount: userNames.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 0),
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemBuilder: (_, int index) =>
                            FromYou(userNames[index]),
                        itemCount: userNames.length,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 0),
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemBuilder: (_, int index) =>
                            Request(userNames[index]),
                        itemCount: userNames.length,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 40.8,
                  child: Container(
                    color: const Color(0xff112a39),
                    height: 3.9,
                    width: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FromFriends extends StatelessWidget {
  final String user;
  FromFriends(this.user);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print(this.user);
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 43.8,
            width: 2,
            child: Container(
              color: const Color(0xff1c3a4d),
              height: 175,
              width: 2,
            ),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 30),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 45,
                        width: 45,
                        child: CircleAvatar(),
                      ),
                      Container(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  user,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.33,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ' sent you a request',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.33,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff5c717e),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              '14h ago',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff5c717e),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(45.3, 0, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff1c3a4d),
                          borderRadius: BorderRadius.circular(15)),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    '\$492.30',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffeeeeee),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'via Payoneer',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 11.33,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffeeeeee).withOpacity(0.5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 45,
                                  width: 45,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(this.user + " cancel Pressed");
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff436d88),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0xff1c3a4d),
                                          child: Icon(
                                            Icons.close,
                                            color: const Color(0xff436d88),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                  height: 45,
                                  width: 45,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(this.user + " accept Pressed");
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xffe3a33d),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FromYou extends StatelessWidget {
  final String user;
  FromYou(this.user);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print(this.user);
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 43.8,
            width: 2,
            child: Container(
              color: const Color(0xff1c3a4d),
              height: 175,
              width: 2,
            ),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 30),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 45,
                          width: 45,
                          child: CircleAvatar(),
                        ),
                        Container(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    user,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.33,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffEEEEEE),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    ' sent you funds',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.33,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5c717e),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text(
                                '14h ago',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5c717e),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(45.3, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff1c3a4d),
                            borderRadius: BorderRadius.circular(15)),
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      '\$492.30',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffeeeeee),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'via Payoneer',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11.33,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color(0xffeeeeee).withOpacity(0.5),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 45,
                                    width: 45,
                                    child: GestureDetector(
                                      onTap: () {
                                        print(this.user + " add Pressed");
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xffe3a33d),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Request extends StatelessWidget {
  final String user;
  Request(this.user);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print(this.user);
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 43.8,
            width: 2,
            child: Container(
              color: const Color(0xff1c3a4d),
              height: 175,
              width: 2,
            ),
          ),
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 30),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 45,
                          width: 45,
                          child: CircleAvatar(),
                        ),
                        Container(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    user,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.33,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffEEEEEE),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    ' sent you a request for a loan',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.33,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5c717e),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text(
                                '14h ago',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5c717e),
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
          ),
        ],
      ),
    );
  }
}
