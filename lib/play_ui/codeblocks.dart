// Future<dynamic> loginWithUsernameAndPassword(String email, String password) async {
//   Modular.get()
//   print("email: in logincontroller "+email);
//   final url  = "http://10.0.2.2:5000/signin";
//   return await http.post(
//     //Uri.http('10.0.2.2', 'test'),
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'email': email,
//       'password': password
//     }),
//   );
//
// }



//////////////////////////////////////////////////////////////////
// OverlayState optionsBuilder = Overlay.of(context);
//
// OverlayEntry options = OverlayEntry(
//     builder: (context) => Positioned(
//         top: 66.0,
//         right: 50.0,
//         child: Container(
//             child: Column(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//
//                     },
//                     child: Container(
//                         width: 66,
//                         child: Icon(Icons.close)
//                     ),
//                   ),
//
//                   Container(
//                       child: Text("$count",
//                           style: GoogleFonts.montserrat(
//                               fontSize: 50,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w200
//                           ))
//                   )
//                 ]
//             )
//         )
//     )
// );
// // check if there is already an overlayentry in state if yes then remove.
// // check if the button is pressed or not.
// optionsBuilder.insert(options);
//options.remove();




///////////////////////////////////////////////////////////////////////////////////
// a snippet that shows all accounts on a  horizontal scroll
////////////////////////////////////////////////////////////
// Container(
//   padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Container(
//         alignment: Alignment.bottomLeft,
//         child: Text(
//           'Accounts',
//           style: GoogleFonts.montserrat(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: Color(0xffeeeeee),
//           ),
//         ),
//       ),
//       Icon(
//         Icons.arrow_forward,
//         color: const Color(0xff7099b2),
//       ),
//     ],
//   ),
// ),
// Container(
//   height: 18.7,
// ),
// Container(
//   padding: EdgeInsets.only(left: 18.3),
//   height: 160,
//   decoration: BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: const Color(0xff000000).withOpacity(0.25),
//         blurRadius: 15.0, // has the effect of softening the shadow
//         spreadRadius: 0.5, // has the effect of extending the shadow
//         offset: Offset(
//           10.0, // horizontal, move right 10
//           10.0, // vertical, move down 10
//         ),
//       ),
//     ],
//   ),
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     reverse: false,
//     itemBuilder: (_, int index) =>
//         BankCardList(money[index], from[index]),
//     itemCount: money.length,
//   ),
// ),
// Container(height: 35.3),
// Container(
//   padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       Container(
//         decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff000000).withOpacity(0.25),
//                 blurRadius:
//                     15.0, // has the effect of softening the shadow
//                 spreadRadius:
//                     0.5, // has the effect of extending the shadow
//                 offset: Offset(
//                   0.0, // horizontal, move right 10
//                   10.0, // vertical, move down 10
//                 ),
//               ),
//             ],
//             color: const Color(0xff1c3a4d),
//             borderRadius: BorderRadius.circular(15)),
//         width: 163.33,
//         height: 101.33,
//         child: Container(
//           padding: EdgeInsets.fromLTRB(25, 18.7, 25, 0),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: CircleAvatar(
//                   backgroundColor: const Color(0xff2a4f67),
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       '\$',
//                       style: GoogleFonts.montserrat(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: const Color(0xfff5a623),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 7.7,
//               ),
//               Container(
//                 child: Text(
//                   'Send Money',
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.montserrat(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xffeeeeee),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       Container(
//         decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff000000).withOpacity(0.25),
//                 blurRadius:
//                     15.0, // has the effect of softening the shadow
//                 spreadRadius:
//                     0.5, // has the effect of extending the shadow
//                 offset: Offset(
//                   0.0, // horizontal, move right 10
//                   10.0, // vertical, move down 10
//                 ),
//               ),
//             ],
//             color: const Color(0xff1c3a4d),
//             borderRadius: BorderRadius.circular(15)),
//         width: 163.33,
//         height: 101.33,
//         child: Container(
//           padding: EdgeInsets.fromLTRB(25, 18.7, 25, 0),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: CircleAvatar(
//                   backgroundColor: const Color(0xff2a4f67),
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       '\$',
//                       style: GoogleFonts.montserrat(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: const Color(0xfff5a623),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 7.7,
//               ),
//               Container(
//                 child: Text(
//                   'Send Money',
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.montserrat(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xffeeeeee),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
// Container(
//   height: 50,
// ),
///////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////
// Snippet to show all the bank cards you have.
////////////////////////////////////////////////////////////
// class BankCardList extends StatelessWidget {
//   final int money;
//   final String from;
//   BankCardList(this.money, this.from);
//   @override
//   Widget build(BuildContext context) {
//     return new GestureDetector(
//       onTap: () {
//         print("object");
//       },
//       child: GestureDetector(
//         onTap: () {
//           print(this.from);
//         },
//         child: Card(
//           elevation: 0,
//           color: Colors.transparent,
//           child: Container(
//             decoration: BoxDecoration(
//                 color: const Color(0xff1c3a4d),
//                 borderRadius: BorderRadius.circular(15)),
//             width: 136,
//             height: 160,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(20, 25, 15, 16),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Container(
//                         child: CircleAvatar(
//                           backgroundColor: const Color(0xff2a4f67),
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               '\$',
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xfff5a623),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           print(this.from + " More Button Pressed");
//                         },
//                         child: Icon(
//                           Icons.more_vert,
//                           color: const Color(0xff666666),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     height: 28,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Container(
//                         height: 18,
//                         child: Text(
//                           '\$',
//                           style: GoogleFonts.montserrat(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xffeeeeee),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 2,
//                       ),
//                       Container(
//                         child: Text(
//                           money.toString(),
//                           style: GoogleFonts.montserrat(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xffeeeeee),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       from,
//                       style: GoogleFonts.montserrat(
//                         fontSize: 10.67,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffeeeeee).withOpacity(0.5),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//////////////////////////////////////////////////////////////////////////////////////