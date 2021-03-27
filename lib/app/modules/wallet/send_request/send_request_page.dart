import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SendRequestPage extends StatefulWidget {
  @override
  _SendRequestPageState createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Tabbar'ımızın kaç elemanı olucak ?
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1c3a4d),

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
                      'RQUST',
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
                      'SEND',
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
                      'TRNSF',
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
              Page3(),
            ],
          )),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  Page1State createState() => new Page1State();
}

class Page1State extends State<Page1>
    with AutomaticKeepAliveClientMixin<Page1> {
  String dropdownValue = "Day";
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: const Color(0xff112a39),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
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
                          width: 150,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                              keyboardType: TextInputType.number,
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
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 27.5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CUR',
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
                        Container(
                          width: 115,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 27.5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'To',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768b98),
                      ),
                    ),
                    Container(
                      width: 27.5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
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
                        Container(
                          width: 200,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 27.5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'From',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768b98),
                      ),
                    ),
                    Container(
                      width: 27.5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
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
                        Container(
                          width: 200,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  ],
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
                    Container(
                      height: 10,
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
        ));
  }
}

class Page2 extends StatefulWidget {
  @override
  Page2State createState() => new Page2State();
}

class Page2State extends State<Page2>
    with AutomaticKeepAliveClientMixin<Page2> {
  bool get wantKeepAlive => true;
  String dropdownValue = "Day";
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: const Color(0xff112a39),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
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
                          width: 150,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                              keyboardType: TextInputType.number,
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
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 27.5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CUR',
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
                        Container(
                          width: 115,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 27.5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'To',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768b98),
                      ),
                    ),
                    Container(
                      width: 27.5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
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
                        Container(
                          width: 200,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 27.5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'From',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768b98),
                      ),
                    ),
                    Container(
                      width: 27.5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
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
                        Container(
                          width: 200,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  ],
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
                    Container(
                      height: 10,
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
        ));
  }
}

class Page3 extends StatefulWidget {
  @override
  Page3State createState() => new Page3State();
}

class Page3State extends State<Page3>
    with AutomaticKeepAliveClientMixin<Page3> {
  String dropdownValue = "Day";
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: const Color(0xff112a39),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
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
                          width: 150,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextField(
                              keyboardType: TextInputType.number,
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
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 27.5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CUR',
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
                        Container(
                          width: 115,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 27.5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'To',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768b98),
                      ),
                    ),
                    Container(
                      width: 27.5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
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
                        Container(
                          width: 200,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 27.5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'From',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff768b98),
                      ),
                    ),
                    Container(
                      width: 27.5,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
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
                        Container(
                          width: 200,
                          height: 1.25,
                          color: const Color(0xff0D202B),
                        ),
                      ],
                    ),
                  ],
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
                    Container(
                      height: 10,
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
        ));
  }
}
