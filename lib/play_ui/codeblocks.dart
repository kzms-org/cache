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