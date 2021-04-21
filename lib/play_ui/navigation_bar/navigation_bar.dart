// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
//
// import 'package:cache/play_ui/text_widget/text_widget.dart';
// import 'package:flutter_svg/svg.dart';
//
// class NavBarWidget extends StatefulWidget {
//
//   @override
//   _NavBarWidgetState createState() =>
//       _NavBarWidgetState();
// }
//
// class _NavBarWidgetState extends State<NavBarWidget>{
//
//   NavigationBar navigationBar = NavigationBar()
//
//   Color button0;
//   Color button1;
//   Color button2;
//   Color button3;
//   Color button4;
//
//
//
//   void changepage() {
//     if (selectedTab == 0) {
//       setState(() {
//         button0 = const Color(0xffe3a33d);
//         button1 = const Color(0xff386785);
//         button2 = Colors.white;
//         button3 = const Color(0xff386785);
//         button4 = const Color(0xff386785);
//       });
//       print("0");
//     }
//     if (selectedTab == 1) {
//       setState(() {
//         button0 = const Color(0xff386785);
//         button1 = const Color(0xffe3a33d);
//         button2 = Colors.white;
//         button3 = const Color(0xff386785);
//         button4 = const Color(0xff386785);
//       });
//       print("1");
//     }
//     if (selectedTab == 2) {
//       setState(() {
//         button0 = const Color(0xff386785);
//         button1 = const Color(0xff386785);
//         button2 = const Color(0xffe3a33d);
//         button3 = const Color(0xff386785);
//         button4 = const Color(0xff386785);
//       });
//       print("2");
//     }
//     if (selectedTab == 3) {
//       setState(() {
//         button0 = const Color(0xff386785);
//         button1 = const Color(0xff386785);
//         button2 = Colors.white;
//         button3 = const Color(0xffe3a33d);
//         button4 = const Color(0xff386785);
//       });
//       print("3");
//     }
//     if (selectedTab == 4) {
//       setState(() {
//         button0 = const Color(0xff386785);
//         button1 = const Color(0xff386785);
//         button2 = Colors.white;
//         button3 = const Color(0xff386785);
//         button4 = const Color(0xffe3a33d);
//       });
//       print("4");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       color: const Color(0xff1b394c),
//       child: SafeArea(
//         child: Container(
//           height: 66.5,
//           decoration: BoxDecoration(
//             color: const Color(0xff1b394c),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff000000).withOpacity(0.25),
//                 blurRadius: 15.0, // has the effect of softening the shadow
//                 spreadRadius: 0.5, // has the effect of extending the shadow
//                 offset: Offset(
//                   0.0, // horizontal, move right 10
//                   -20.0, // vertical, move down 10
//                 ),
//               ),
//             ],
//           ),
//           child: Container(
//             margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     selectedTab = 0;
//                     changepage();
//                     Modular.to.pushReplacementNamed("/wallet");
//                   },
//                   child: Container(
//                     width: 66,
//                     child: SvgPicture.asset(
//                       "assets/Wallet.svg",
//                       color: button0,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     selectedTab = 1;
//                     changepage();
//                     Modular.to.pushReplacementNamed("/wallet/records");
//                   },
//                   child: Container(
//                     width: 66,
//                     child: SvgPicture.asset(
//                       "assets/Horizontal_view.svg",
//                       color: button1,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Modular.to.pushNamed("wallet/add-funds");
//                   },
//                   child: Container(
//                     width: 48.0,
//                     height: 48.0,
//                     decoration: new BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xff000000).withOpacity(0.5),
//                           blurRadius:
//                           15.0, // has the effect of softening the shadow
//                           spreadRadius:
//                           0.5, // has the effect of extending the shadow
//                           offset: Offset(
//                             0.0, // horizontal, move right 10
//                             0.0, // vertical, move down 10
//                           ),
//                         ),
//                       ],
//                       shape: BoxShape.circle,
//                       color: const Color(0xff315fd6),
//                     ),
//                     child: Icon(Icons.add, color: button2),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     selectedTab = 3;
//                     changepage();
//                     Modular.to.pushReplacementNamed("/wallet/shopping-list");
//                   },
//                   child: Container(
//                     width: 66,
//                     child: SvgPicture.asset(
//                       "assets/Pulse_machine.svg",
//                       color: button3,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     selectedTab = 4;
//                     changepage();
//                   },
//                   child: Container(
//                     width: 66,
//                     child: SvgPicture.asset(
//                       "assets/Credit_card.svg",
//                       color: button4,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
//
// class NavigationBar{
//
//   int selectedTab;
//   Color currentPageColor = const Color(0xffe3a33d);
//   Color otherPagesColor = const Color(0xff386785);
//   Color centralButtonColor = Colors.white;
// }
//
//
