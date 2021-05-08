import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cache/play_ui/page_scaffold/page_scaffold_widget.dart';
import 'package:cache/play_ui/play_ui.dart';
import 'package:cache/play_ui/switch/switch_widget.dart';
import 'package:cache/play_ui/text_field/text_field_widget.dart';
import 'package:cache/play_ui/text_widget/text_widget.dart';

import 'login_controller.dart';

/// To do:
/// Add condition to check if the email and username is empty or not.


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color switch1Color = const Color(0xff24485e);
  final loginController = Modular.get<LoginController>();

  bool isSwitched = false;
  String email;
  String password;

  Widget createHeader({String title}) {
    return Column(
      children: <Widget>[
        Container(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 0,
          ),
          height: 72,
          child: TextWidget(
            title,
            fontSize: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 28),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 120),
                width: 34,
                height: 6,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            Container(),
          ],
        ),
        Container(
          height: 100,
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return PageScaffoldWidget(
      title: 'Login',


      child: //scaffold's body
          Container(
        child: Column(
          children: <Widget>[
            createHeader(
              title: 'Log In to your account & check your wealth.',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFieldWidget(
                  label: "E-Mail",
                  onChanged: (String value) {
                    email = value;
                  },
                ),
                Container(height: 20),
                TextFieldWidget(
                  label: "Password",
                  obscureText: true,
                  onChanged: (String value) {
                    password = value;
                  },
                ),
                Container(height: 20.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    LabelFieldWidget(
                      label: "Remember me",
                    ),
                    SwitchWidget()
                  ],
                ),
              ],
            ),
            Container(
              height: 27,
            ),
            ButtonWidget(
              text: 'Login',
              onTap: () {
               var result =  loginController.loginWithUsernameAndPassword(email, password,context);
               print("The email badly formatted");

               }


                 ),

            Container(
              height: 47,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                height: 1,
                color: Theme.of(context).accentIconTheme.color,
              ),
            ),
            Container(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextWidget.title(
                    'New to this experience?',
                    fontSize: 13,
                  ),
                ),
                Container(
                  width: 5,
                ),
                ButtonWidget.outline(
                  text: "Sign up",
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    loginController.signUp();
                  },
                ),
              ],
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
