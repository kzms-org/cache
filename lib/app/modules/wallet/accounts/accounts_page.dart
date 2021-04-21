import 'package:cache/app/modules/user/cacheuser.dart';
import 'package:cache/app/modules/user/simpleUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cache/play_ui/easy_widgets/easy_widgets.dart';
import 'package:provider/provider.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {

  String date = returnDate();


  int selectedTab = 4;
  int tabcount = 5;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xff386785);
  Color button2 = Colors.white;
  Color button3 = const Color(0xff386785);
  Color button4 = const Color(0xffe3a33d);

  String dropdownValue = "Day";

  void changepage() {
    //This bottombar is customized so we use a spesfic code for bottombar.
    if (selectedTab == 0) {
      setState(() {
        button0 = const Color(0xffe3a33d);
        button1 = const Color(0xff386785);
        button2 = Colors.white;
        button3 = const Color(0xff386785);
        button4 = const Color(0xff386785);
      });
      print("0");
    }
    if (selectedTab == 1) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xffe3a33d);
        button2 = Colors.white;
        button3 = const Color(0xff386785);
        button4 = const Color(0xff386785);
      });
      print("1");
    }
    if (selectedTab == 2) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xff386785);
        button2 = const Color(0xffe3a33d);
        button3 = const Color(0xff386785);
        button4 = const Color(0xff386785);
      });
      print("2");
    }
    if (selectedTab == 3) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xff386785);
        button2 = Colors.white;
        button3 = const Color(0xffe3a33d);
        button4 = const Color(0xff386785);
      });
      print("3");
    }
    if (selectedTab == 4) {
      setState(() {
        button0 = const Color(0xff386785);
        button1 = const Color(0xff386785);
        button2 = Colors.white;
        button3 = const Color(0xff386785);
        button4 = const Color(0xffe3a33d);
      });
      print("4");
    }
  }

  Widget navBar() {
    return Container(
      color: const Color(0xff1b394c),
      child: SafeArea(
        child: Container(
          height: 66.5,
          decoration: BoxDecoration(
            color: const Color(0xff1b394c),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.25),
                blurRadius: 15.0, // has the effect of softening the shadow
                spreadRadius: 0.5, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    selectedTab = 0;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/Wallet.svg",
                      color: button0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedTab = 1;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet/records");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/Horizontal_view.svg",
                      color: button1,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed("/wallet/add-funds");
                  },
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.5),
                          blurRadius:
                          15.0, // has the effect of softening the shadow
                          spreadRadius:
                          0.5, // has the effect of extending the shadow
                          offset: Offset(
                            0.0, // horizontal, move right 10
                            0.0, // vertical, move down 10
                          ),
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: const Color(0xff315fd6),
                    ),
                    child: Icon(Icons.add, color: button2),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedTab = 3;
                    changepage();
                    Modular.to.pushReplacementNamed("/wallet/chatbot");
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/chatbot.svg",
                      color: button3,
                      height: 48,
                      width: 48,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedTab = 4;
                    changepage();
                  },
                  child: Container(
                    width: 66,
                    child: SvgPicture.asset(
                      "assets/Credit_card.svg",
                      color: button4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    final user = Provider.of<SimpleUser>(context);

    print(user);

    return Scaffold(
      backgroundColor: const Color(0xff112a39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              print("Ad Button Pressed");
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.dehaze, color: const Color(0xff7099b2)),
          color: const Color(0xff7099b2),
          onPressed: () {
            //Modular.to.pushNamed('/security/profile');
            print('sidebar');
          },
        ),
        elevation: 0,
        title: Text(
          'Accounts',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffeeeeee),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/profilephoto.png")))),
                      Container(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              user.firstName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffeeeeee),
                              ),
                            ),
                          ),
                          Container(
                            width: 96,
                            height: 17.666667938232422,
                            child: Text(
                              date,
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
                  GestureDetector(
                    onTap: () {
                    },
                    child: Icon(
                      Icons.settings,
                      color: const Color(0xff7099b2),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 26.7,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Container(
                decoration: BoxDecoration(
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
                    color: const Color(0xff1c3a4d),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                height: 296.67,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Accounts',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'Today, ' + date,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11.33,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee).withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                print("add button pressed");
                              },
                              child: Container(
                                width: 78,
                                height: 33,
                                decoration: BoxDecoration(
                                  color: const Color(0xff0e2737),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: Text(
                                        'Add',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.67,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 36,
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }

}
