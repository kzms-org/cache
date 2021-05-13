import 'package:cache/app/modules/wallet/add_funds/add_funds_controller.dart';
import 'package:cache/play_ui/button/button_widget.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SendRequestPage extends StatefulWidget {
  final int initialIndex;

  const SendRequestPage({Key key, this.initialIndex}) : super(key: key);

  @override
  _SendRequestPageState createState() => _SendRequestPageState(initialIndex);
}

class _SendRequestPageState extends State<SendRequestPage> {
  int initialIndex;

  _SendRequestPageState( this.initialIndex);
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
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
            bottom: TabBar(
              unselectedLabelColor: const Color(0xffeeeeee).withOpacity(0.5),
              labelColor: Color(0xfff5a623),
              indicatorColor: Color(0xfff5a623),
              tabs: <Widget>[
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'INCOME',
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
                      'EXPENSE',
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
          )),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  Page1State createState() => new Page1State();
}

class Page1State extends State<Page1> with AutomaticKeepAliveClientMixin<Page1> {
  bool get wantKeepAlive => true;
  AddFundsController addFundsController = Modular.get<AddFundsController>();
  double incomeAmount = 0;
  DateTime incomeDate;
  final format = DateFormat("yyyy-MM-dd");
  String incomeDescription;
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
                          'AMOUNT',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff768b98),
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            cursorColor: Color(0xfff5a623),
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                            style:GoogleFonts.montserrat(color: Colors.white) ,
                            onChanged: (String val){
                              if(val == "") val = "0.0";
                              incomeAmount = double.parse(val);
                              setState(() {
                                incomeAmount;
                              });
                            },
                          ),
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
                          'CURRANCY',
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
                          transform:
                          Matrix4.translationValues(30, 0, 0.0),
                          child: Text(
                            "SAR",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.67,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'DESCRIPTION',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff768b98),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            cursorColor: Color(0xfff5a623),
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                            ),
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            style: GoogleFonts.montserrat(color: Colors.white) ,
                            onChanged: (String val){
                              incomeDescription = val;
                              setState(() {
                                incomeDescription;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'TRANSACTION DATE',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff768b98),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: DateTimeField(
                              format: format,
                              decoration: InputDecoration(
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
                                incomeDate = currentValue;
                              }
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Container(
                height: 15,
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
                          incomeAmount.toString()+" SAR",
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
              Container(
                padding: EdgeInsets.fromLTRB(25, 24, 25, 24),
                height: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ButtonWidget(
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff315fd6),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          text: 'Add',
                          color: Colors.white,
                          onTap: () {
                            print("adding");
                            addFundsController.addIncome(incomeAmount, incomeDate, incomeDescription, context);
                            Modular.to.pop();
                          },
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

class Page2State extends State<Page2> with AutomaticKeepAliveClientMixin<Page2> {
  bool get wantKeepAlive => true;
  AddFundsController addFundsController = Modular.get<AddFundsController>();
  double expenseAmount = 0;
  DateTime expenseDate;
  final format = DateFormat("yyyy-MM-dd");
  String expenseDescription;
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
                          'AMOUNT',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff768b98),
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            cursorColor: Color(0xfff5a623),
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                            style:GoogleFonts.montserrat(color: Colors.white) ,
                            onChanged: (String val){
                              if(val == "") val = "0.0";
                              expenseAmount = double.parse(val);
                              setState(() {
                                expenseAmount;
                              });
                            },
                          ),
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
                          'CURRANCY',
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
                          transform:
                          Matrix4.translationValues(30, 0, 0.0),
                          child: Text(
                            "SAR",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.67,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'DESCRIPTION',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff768b98),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            cursorColor: Color(0xfff5a623),
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                            ),
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            style: GoogleFonts.montserrat(color: Colors.white) ,
                            onChanged: (String val){
                              expenseDescription = val;
                              setState(() {
                                expenseDescription;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.5, 30, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'TRANSACTION DATE',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff768b98),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: DateTimeField(
                              format: format,
                              decoration: InputDecoration(
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
                                expenseDate = currentValue;
                              }
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Container(
                height: 15,
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
                          expenseAmount.toString()+" SAR",
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
              Container(
                padding: EdgeInsets.fromLTRB(25, 24, 25, 24),
                height: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ButtonWidget(
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff315fd6),
                            borderRadius: BorderRadius.circular(2),

                          ),
                          text: 'Add',
                          color: Colors.white,
                          onTap: () {
                            addFundsController.addExpense(expenseAmount, expenseDate, expenseDescription,context);
                            Modular.to.pop();
                            },
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

