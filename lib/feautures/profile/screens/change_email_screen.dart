// import 'package:flutter/material.dart';
// import 'package:foodie_screen/config/colors.dart';

// class ChangeEmailScreen extends StatelessWidget {
//   const ChangeEmailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("E-Mail adresse"),
//       backgroundColor: backroundColor1,),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               backroundColor2,
//               backroundColor1,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const TextField(
//               textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   labelText: "Aktuelle E-Mail Adresse",
//                   labelStyle: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
//                   ),
//                 ),
//               ),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: "Neue E-Mail Adresse",
//                   labelStyle: TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 52, 42, 29)),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 52, 42, 29)),
//                   ),
//                 ),
//                 style: TextStyle(color: Colors.white),
//                 keyboardType: TextInputType.phone,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: backroundColor1),
//                 onPressed: () {
//                 // E-Mail zum speichern
//                 },
//                 child: const Text("E-Mail Adresse ändern",
//                     style: TextStyle(color: Color.fromARGB(255, 243, 238, 235))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }