// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:foodie_screen/config/colors.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({super.key});

//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final TextEditingController _currentPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isCurrentPasswordVisible = false;
//   bool _isNewPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Passwort ändern"),
//         backgroundColor: backroundColor1,
//       ),
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
//               TextField(
//                 controller: _currentPasswordController,
//                 obscureText: !_isCurrentPasswordVisible,
//                 decoration: InputDecoration(
//                   labelText: "Aktuelles Passwort",
//                   labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
//                   enabledBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                       color: const Color.fromARGB(255, 78, 50, 13),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _newPasswordController,
//                 obscureText: !_isNewPasswordVisible,
//                 decoration: InputDecoration(
//                   labelText: "Neues Passwort",
//                   labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 50, 13)),
//                   enabledBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
//                   ),
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(color: Color.fromARGB(255, 78, 50, 13)),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                       color: const Color.fromARGB(255, 78, 50, 13),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isNewPasswordVisible = !_isNewPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: backroundColor1),
//                 onPressed: () async {
//                   final currentPassword = _currentPasswordController.text;
//                   final newPassword = _newPasswordController.text;
//                   if (currentPassword.isNotEmpty && newPassword.isNotEmpty) {
//                     try {
//                       final user = _auth.currentUser;
//                       final credential = EmailAuthProvider.credential(
//                         email: user?.email ?? '',
//                         password: currentPassword,
//                       );
//                       await user?.reauthenticateWithCredential(credential);
//                       await user?.updatePassword(newPassword);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Passwort erfolgreich aktualisiert")),
//                       );
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Fehler beim Aktualisieren des Passworts: $e")),
//                       );
//                     }
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Passwörter dürfen nicht leer sein")),
//                     );
//                   }
//                 },
//                 child: const Text("Speichern", style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
