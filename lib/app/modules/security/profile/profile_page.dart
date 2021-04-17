import 'package:cache/app/modules/security/auth.dart';
import 'package:cache/app/modules/security/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Jordan Lane";
  final profileController = Modular.get<ProfileController>();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xff7099b2)),
          onPressed: () => Modular.to.pop(),
        ),
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            print("Pressed the user profile and name.");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  transform: Matrix4.translationValues(-15.0, 0, 0.0),
                  width: 52.0,
                  height: 52.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/profilephoto.png")))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      username,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffeeeeee),
                      ),
                    ),
                  ),
                  Container(
                    width: 96,
                    height: 17.666667938232422,
                    child: Text(
                      'View Profile',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff).withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: //scaffold's body
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 43.3,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Modular.to.pushReplacementNamed('/user/activity');
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'Activity',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 55, 0),
                    child: Container(
                      height: 1,
                      color: const Color(0xff23475d),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Button2 clicked");
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'My Wallet',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Button3 clicked");
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'Records',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Button4 clicked");
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'Shopping List',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Button5 clicked");
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'Accounts',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 55, 0),
                    child: Container(
                      height: 1,
                      color: const Color(0xff23475d),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Modular.to.pushReplacementNamed('/user/settings');
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'Settings',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Button7 clicked");
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'FAQ & Help',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Button8 clicked");
                    },
                    child: Container(
                      height: 22,
                      child: Text(
                        'About',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Color(0xffeeeeee),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 55, 0),
                    child: Container(
                      height: 1,
                      color: const Color(0xff23475d),
                    ),
                  ),
                  Container(
                    height: 33.8,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("profile page signout button pressed");
                profileController.signOut();

              },
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.exit_to_app,
                            color: const Color(0xff7099b2),
                          ),
                        ),
                        Container(
                          width: 14,
                        ),
                        Container(
                          child: Text(
                            'Logout',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffeeeeee),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
