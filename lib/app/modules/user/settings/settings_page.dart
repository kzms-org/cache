import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Tabbar'ımızın kaç elemanı olucak ?
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c3a4d),

          title: Text(
            'Settings',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffeeeeee),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.close, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              Modular.to.pop();
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
                    'GENERAL',
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
                    'PROFILE',
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
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  Color switch1Color = const Color(0xff24485e);
  Color switch2Color = const Color(0xff24485e);

  Color checkbox1Color = const Color(0xff112a39);
  Color checkboxborderColor1 = const Color(0xff7099b2);

  Color checkbox2Color = const Color(0xff112a39);
  Color checkboxborderColor2 = const Color(0xff7099b2);

  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff112a39),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Funds Managements Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Funds Managements",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "3 ACCOUNTS",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Dark Mode Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Dark Mode",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "DISABLED",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 250),
                                  height: 31,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: switch1Color,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Switch(
                                    value: isSwitched1,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched1 = value;
                                        print(isSwitched1);
                                        if (value == true) {
                                          switch1Color =
                                              const Color(0xfff3a422);
                                        } else {
                                          switch1Color =
                                              const Color(0xff24485e);
                                        }
                                      });
                                    },
                                    activeColor: const Color(0xffffffff),
                                    inactiveTrackColor: Colors.transparent,
                                    activeTrackColor: Colors.transparent,
                                  ),
                                ),
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Push Notifications Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Push Notifications",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "LIGHT",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 250),
                                  height: 31,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: switch2Color,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Switch(
                                    value: isSwitched2,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched2 = value;
                                        print(isSwitched2);
                                        if (value == true) {
                                          switch2Color =
                                              const Color(0xfff3a422);
                                        } else {
                                          switch2Color =
                                              const Color(0xff24485e);
                                        }
                                      });
                                    },
                                    activeColor: const Color(0xffffffff),
                                    inactiveTrackColor: Colors.transparent,
                                    activeTrackColor: Colors.transparent,
                                  ),
                                ),
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Private Informations Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Private Informations",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "ENABLED",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Sharing Settings Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xff284d64),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.settings,
                                            color: Colors.white,
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
                                          child: Text(
                                            "Automatic Updates",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14.67,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffeeeeee),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                        ),
                                        Container(
                                          child: Text(
                                            "DISABLED",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 10.67,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff888888),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(27.9, 0, 0, 0),
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: checkboxborderColor1),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 250),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: checkbox1Color,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Container(
                                          child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                                Colors.transparent),
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          value: isSwitched3,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched3 = value;
                                              print(isSwitched3);
                                              if (value == true) {
                                                checkbox1Color =
                                                    const Color(0xff315fd6);
                                                checkboxborderColor1 =
                                                    const Color(0xff315fd6);
                                              } else {
                                                checkbox1Color =
                                                    const Color(0xff112a39);
                                                checkboxborderColor1 =
                                                    const Color(0xff7099b2);
                                              }
                                            });
                                          },
                                          activeColor: Colors.transparent,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Automatic Updates Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xff284d64),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.settings,
                                            color: Colors.white,
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
                                          child: Text(
                                            "Automatic Updates",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14.67,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffeeeeee),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                        ),
                                        Container(
                                          child: Text(
                                            "DISABLED",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 10.67,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff888888),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(27.9, 0, 0, 0),
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: checkboxborderColor2),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 250),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: checkbox2Color,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Container(
                                          child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                                Colors.transparent),
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          value: isSwitched4,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched4 = value;
                                              print(isSwitched4);
                                              if (value == true) {
                                                checkbox2Color =
                                                    const Color(0xff315fd6);
                                                checkboxborderColor2 =
                                                    const Color(0xff315fd6);
                                              } else {
                                                checkbox2Color =
                                                    const Color(0xff112a39);
                                                checkboxborderColor2 =
                                                    const Color(0xff7099b2);
                                              }
                                            });
                                          },
                                          activeColor: Colors.transparent,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Latest Updates Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Latest Updates",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "ENABLED",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Interface theme Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Interface theme",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "Enabled",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Request Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Request",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ask someone for a loan",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Request Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff284d64),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
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
                                        child: Text(
                                          "Request",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          "Ask someone for a loan",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10.67,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff888888),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
              Container(
                height: 50,
              ),
            ],
          ),
        ));
  }
}

class Page2 extends StatefulWidget {
  Page2State createState() => Page2State();
}

class Page2State extends State<Page2> {
  List userNames = [
    "Adam",
    "Tony",
    "Cansu",
    "Tony",
    "Cansu",
    "Tony",
    "Cansu",
    "Tony",
    "Cansu"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff112a39),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(27.9, 30, 27.9, 30),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/profilephoto.png"),
                    ),
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
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      'Jordan Lane',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffeeeeee),
                      ),
                    ),
                  ),
                  Container(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Container(
                      height: 1.25,
                      color: const Color(0xff0D202B),
                    ),
                  ),
                  Container(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      'USERNAME',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff84939d),
                      ),
                    ),
                  ),
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
                          hintText: "bryanaholly",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Container(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      'EMAIL',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff84939d),
                      ),
                    ),
                  ),
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
                            hintText: "contact@holly.bry")),
                  ),
                  Container(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      'LINKED ACCOUNTS',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff84939d),
                      ),
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(18.3, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
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
                        ),
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
                      ],
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Container(
                      height: 1.25,
                      color: const Color(0xff0D202B),
                    ),
                  ),
                  Container(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      'DESCRIPTON',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff84939d),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                child: Text(
                  'Curabitur sodales efficitur imperdiet. Integer ac vestibulum nunc. Aenean lacus lorem, iaculis lobortis aliquet in, finibus eget neque. Praesent semper, sem ut blandit sollicitudin, leo nulla bibendum enim, molestie sodales tellus ex ac diam. Ut vulputate sit amet justo nec vulputate. Class aptent taciti sociosq',
                  style: GoogleFonts.montserrat(
                    fontSize: 13.33,
                    color: Color(0xffeeeeee),
                  ),
                ),
              ),
              Container(height: 50),
            ],
          ),
        ));
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
