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







// Widget createTileTimeBasedDeprecated(BuildContext context, String text, IconData icon, int index) {
//   return GestureDetector(
//     onTap: (){
//       print("inside time based tile");
//       // open overlay. take values, submit to database, get reply
//       Navigator.pop(context);
//     },
//     child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           questionWidget(icon, text),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.redAccent,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//
//
//                 Container(
//                   transform:
//                   Matrix4.translationValues(-10, 0, 0.0),
//                   child:
//                   Theme(
//                     data: Theme.of(context).copyWith(
//                       canvasColor: Colors.redAccent,
//                     ),
//                     child: DropdownButton<String>( // DropdownButtonHideUnderline
//                       value: dropdownValue[index].toString(),
//                       items: <String>[
//                         'Week',
//                         'Month',
//                         'Year'
//                       ].map<DropdownMenuItem<String>>(
//                               (String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value+"?"),
//                             );
//                           }).toList(),
//                       onChanged: (String newValue) {
//                         setState(() {
//                           print(newValue);
//                           dropdownValue[index] = newValue;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ]),
//   );
// }
