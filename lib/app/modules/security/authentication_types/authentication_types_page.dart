import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cache/play_ui/button/button_widget.dart';
import 'package:cache/play_ui/play_ui.dart';
import 'package:cache/play_ui/text_widget/text_widget.dart';

class AuthenticationTypesPage extends StatefulWidget {
  @override
  _AuthenticationTypesPageState createState() =>
      _AuthenticationTypesPageState();
}

class _AuthenticationTypesPageState extends State<AuthenticationTypesPage> {
  Widget createLogo(Widget logo) {
    return Container(
      child: logo,
    );
  }

  Widget createTitle(String title) {
    return Container(
      width: 281,
      height: 45,
      child: TextWidget.title(
        title,
        fontSize: 40,
      ),
    );
  }

  Widget createDescription(String description) {
    return Container(
      width: 324,
      height: 72,
      child: TextWidget.subTitle(
        description,
        textAlign: TextAlign.center,
        fontSize: 17,
      ),
    );
  }

  Widget createHeader({Widget logo, String title, String description}) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
        ),
        createLogo(logo),
        Container(
          height: 18,
        ),
        createTitle(title),
        Container(
          height: 9,
        ),
        createDescription(description),
        Container(
          width: 33.33,
          height: 5.33,
          color: const Color(0xff86959C),
        )
      ],
    );
  }

  Widget createDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 141,
          height: 1,
          color: const Color(0xff23475d),
        ),
        Container(
          width: 29,
          child: Text(
            'OR',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 10.66,
              fontWeight: FontWeight.w600,
              color: Color(0xffeeeeee),
            ),
          ),
        ),
        Container(
          width: 141,
          height: 1,
          color: const Color(0xff23475d),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffoldWidget(
      centralize: true,
      hideAppBar: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          createHeader(
            logo: Image(
              image: AssetImage("assets/Logo.png"),
            ),
            title: 'Cache',
            description: 'You are rich, we just help you realize that!',
          ),
          Container(
            height: 113,
          ),
          ButtonWidget(
            text: 'Login',
            onTap: () {
              Modular.to.pushReplacementNamed('/security/login');
            },
          ),
          Container(
            height: 9,
          ),
          ButtonWidget(
            text: 'Sign up',
            backgroudColor: Theme.of(context).accentColor,
            splashColor: Theme.of(context).primaryColor,
            onTap: () {
              Modular.to.pushReplacementNamed('/security/signup');
            },
          ),
          Container(
            height: 27.5,
          ),
          createDivider(),
          Container(
            height: 27.5,
          ),
          ButtonWidget.icon(
            text: 'Login with Twitter',
            backgroudColor: HexColor('#1c3a4d'),
            color: HexColor('#58b5ef'),
            icon: SvgPicture.asset(
              "assets/twitter.svg",
              color: HexColor('#58b5ef'),
            ),
            onTap: () {
              print("Login with Twitter Pressed");
            },
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}
