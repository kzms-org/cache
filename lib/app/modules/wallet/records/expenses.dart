import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Expenses extends StatelessWidget {
  final double money;
  final String from;
  final DateTime date;

  Expenses(this.money, this.from, this.date);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: GestureDetector(
        onTap: () {},
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
                                width: 200,
                                child: Text(
                                  from,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.67,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  from,
                                  overflow: TextOverflow.ellipsis,
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
                            width: 70,
                            child: Text(
                              DateFormat("d MMM, yyyy").format(date),
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
