import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signup_controller.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSwitched = false;
  Color checkbox1Color = const Color(0xff112a39);
  Color checkboxborderColor1 = const Color(0xff7099b2);
  String username;
  String email;
  String emailConfirmation;
  String password;

  final signUpController = Modular.get<SignUpController>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      //Appbar hidden because we dont use them so if you want delete them.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xff7099b2)),
          onPressed: () => Modular.to.pop(),
        ),
        elevation: 0,
        title: Text('Sign up',
            style: GoogleFonts.montserrat(
              fontSize: 14.67,
              color: Color(0xffeeeeee),
            )),
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
                height: 72,
                child: Text(
                  'The most difficult thing is the decision to act, the rest is merely tenacity.',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: Color(0xffeeeeee),
                  ),
                ),
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
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                    child:
                    TextField(
                        style: GoogleFonts.montserrat(
                          fontSize: 13.33,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffeeeeee),
                        ),
                        onChanged: (String value) {
                          username = value;
                        },
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
                        onChanged: (String value) {
                          email = value;
                        },
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
                    child: Text(
                      'CONFIRM EMAIL',
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
                        onChanged: (String value) {
                          emailConfirmation = value;
                        },
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
                    child: Text(
                      'Password',
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
                        onChanged: (String value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Container(height: 20.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(27.9, 0, 0, 0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: checkboxborderColor1),
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
                                  unselectedWidgetColor: Colors.transparent),
                              child: Checkbox(
                                checkColor: Colors.white,
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                    if (value == true) {
                                      checkbox1Color = const Color(0xff315fd6);
                                      checkboxborderColor1 =
                                          const Color(0xff315fd6);
                                    } else {
                                      checkbox1Color = const Color(0xff112a39);
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
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          'I Accept Term & Conditions',
                          style: GoogleFonts.montserrat(
                            fontSize: 13.33,
                            color: Color(0xffeeeeee),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 26.7,
              ),
              GestureDetector(
                onTap: () {
                  signUpController.signUp(username, email, emailConfirmation, password);
                },
                child: Container(
                  width: 321,
                  height: 47,
                  decoration: BoxDecoration(
                    color: const Color(0xfff5a623),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 51,
                    height: 17,
                    child: Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 13.32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 46.5,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                child: Container(
                  height: 1,
                  color: const Color(0xff23475d),
                ),
              ),
              Container(
                height: 20.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Already Registered?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.67,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffEEEEEE),
                      ),
                    ),
                  ),
                  Container(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Login Pressed");
                    },
                    child: Container(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.67,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff315fd6),
                        ),
                      ),
                    ),
                  ),
                ],
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
