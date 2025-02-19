import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodie_screen/config/themes.dart';
import 'package:foodie_screen/data/repository/auth_repository.dart';
import 'package:foodie_screen/data/repository/database_repository.dart';
import 'package:foodie_screen/data/repository/firebase_auth_repository.dart';
import 'package:foodie_screen/data/repository/recipe/shared_preferences_recipe_repository.dart';
import 'package:foodie_screen/data/repository/shared_preferences_database.dart';
import 'package:foodie_screen/data/repository/user_notifier.dart';
import 'package:foodie_screen/data/repository/user_repository.dart';
import 'package:foodie_screen/feautures/authentification/screens/login_screen.dart';
import 'package:foodie_screen/firebase_options.dart';
import 'package:foodie_screen/shared/widgets/buttom_navigator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");

  final sharedPreferecesRecipeRepository = SharedPreferencesRecipeRepository();
  await sharedPreferecesRecipeRepository.init();
  await sharedPreferecesRecipeRepository.getAllCollections();

  final userRepository = UserRepository();

  runApp(MultiProvider(
    providers: [
      Provider<DatabaseRepository>(create: (_) => SharedPreferencesDatabase()),
      ChangeNotifierProvider<SharedPreferencesRecipeRepository>(create: (_) => sharedPreferecesRecipeRepository),
      Provider<AuthRepository>(create: (_) => FirebaseAuthRepository()),
      Provider<UserRepository>(create: (_) => userRepository),
      StreamProvider<UserNotifier?>(
        create: (context) => context.read<AuthRepository>().authStateChanges.map((user) {
          if (user != null) {
            return UserNotifier(userRepository, user.userId);
          }
          return null;
        }),
        initialData: null,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
 
 final authInstance = FirebaseAuth.instance;
 final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Foodie",
      theme: myTheme,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildWideLayout(context);
            } else {
              return _buildNarrowLayout(context);
            }
          },
        ),
      )
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return StreamBuilder(
      stream: authInstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          log("Benutzer eingeloggt: ${user != null}");
          if (user == null) {
            return const LoginScreen(); 
          } else {
            return FutureBuilder(
              future: context.read<UserRepository>().loadUsername(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const ButtonNavigator();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return StreamBuilder(
      stream: authInstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          log("Benutzer eingeloggt: ${user != null}");
          if (user == null) {
            return const LoginScreen(); 
          } else {
            return FutureBuilder(
              future: context.read<UserRepository>().loadUsername(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const ButtonNavigator();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
