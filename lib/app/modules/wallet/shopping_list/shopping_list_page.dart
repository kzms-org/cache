import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  int selectedTab = 3;
  int tabcount = 5;
  Color button0 = const Color(0xff386785);
  Color button1 = const Color(0xff386785);
  Color button2 = Colors.white;
  Color button3 = const Color(0xffe3a33d);
  Color button4 = const Color(0xff386785);

//This bottombar is customized so we use a spesfic code for bottombar.
  void changepage() {
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

  Widget build(BuildContext context) {
    return DefaultTabController(
      // Tabbar'ımızın kaç elemanı olucak ?
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c3a4d),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_add_check,
                  color: const Color(0xff7099b2)),
              color: const Color(0xff7099b2),
              onPressed: () {
                print("Okey Button Pressed");
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.dehaze, color: const Color(0xff7099b2)),
            color: const Color(0xff7099b2),
            onPressed: () {
              Modular.to.pushNamed('/security/profile');
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: GestureDetector(
              onTap: () {
                print("add item clicked");
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 1,
                      color: const Color(0xff23475d),
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.playlist_add,
                          size: 30,
                          color: const Color(0xff768b98),
                        ),
                        Container(
                          width: 15,
                        ),
                        Container(
                          width: 119.33333587646484,
                          height: 16,
                          child: Text(
                            'Add an item...',
                            style: GoogleFonts.montserrat(
                              fontSize: 13.33,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff768b98),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Text(
            'Shopping list',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffeeeeee),
            ),
          ),
          centerTitle: true,
        ),
        // TabBarView içerisine Tabbar içerisindeki elemanlarla
        // eşleşicek sayfaları ekliyoruz
        body: Container(
            color: const Color(0xff112a39),
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 50),
                scrollDirection: Axis.vertical,
                reverse: false,
                itemBuilder: (_, int index) =>
                    MyAppOne(products[index], money[index]),
                itemCount: products.length,
              ),
            )),
        bottomNavigationBar: Container(
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
                        Modular.to.pushNamed("wallet/add-funds");
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
                      },
                      child: Container(
                        width: 66,
                        child: SvgPicture.asset(
                          "assets/Pulse_machine.svg",
                          color: button3,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedTab = 4;
                        changepage();
                        Modular.to.pushReplacementNamed("/wallet/accounts");
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
        ),
      ),
    );
  }
}

List products = [
  "headphones",
  "smarthpone",
  "cheap iphone",
  "cool sunglasses",
  "new car",
  "school",
  "friends",
  "car",
  "toys",
  "food",
];
List<int> money = [23, 544, 765, 76, 54, 65, 34, 6745, 234, 564];

class MyAppOne extends StatefulWidget {
  final String element0;
  final int money0;
  MyAppOne(this.element0, this.money0);
  _MyAppState createState() => _MyAppState(element0, money0);
}

class _MyAppState extends State<MyAppOne> {
  bool isSwitched = false;
  Color checkbox1Color = const Color(0xff112a39);
  Color checkboxborderColor1 = const Color(0xff7099b2);
  final int money;
  final String element;
  _MyAppState(this.element, this.money);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        print("object");
        //Navigator.pushNamed(context, "sayfa.arasayfa.sohbet");
      },
      child: GestureDetector(
        onTap: () {
          print(this.element);
        },
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
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
                                      unselectedWidgetColor:
                                          Colors.transparent),
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                        print(this.element +
                                            " " +
                                            isSwitched.toString());
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
                          Container(
                            width: 12.7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  element,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.67,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$ " + money.toString(),
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
                      GestureDetector(
                        onTap: () {
                          print(this.element + " more clicked");
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: const Color(0xff374e5d),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(37, 0, 0, 0),
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
    ));
  }
}
