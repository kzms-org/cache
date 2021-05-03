import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_funds_controller.dart';

class AddFundsPage extends StatefulWidget {
  @override
  _AddFundsPageState createState() => _AddFundsPageState();
}

class _AddFundsPageState extends State<AddFundsPage> {
  final addFundsController  = Modular.get<AddFundsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      //Appbar hidden because we dont use them so if you want delete them.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xff7099b2)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text(
          'Add funds',
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
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 15.7,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                child: Text(
                  'It’s always good to have more money on you.',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Color(0xffeeeeee),
                  ),
                ),
              ),
              Container(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 0, 0),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: 120),
                        width: 33.33,
                        height: 5.33,
                        color: const Color(0xffeeeeee)),
                  ),
                  Container(),
                ],
              ),
              Container(
                height: 21,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    addFundsController.selectFileToUpload(context);
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffe9486d),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.transfer_within_a_station,
                                      color: Colors.white,
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
                                      "Upload Transactions CSV",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.67,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffeeeeee),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "You can upload a CSV transactions/statements file",
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
              Container(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
