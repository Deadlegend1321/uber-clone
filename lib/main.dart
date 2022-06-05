import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/screens/login_screen.dart';
import 'package:uber_clone/screens/main_screen.dart';
import 'package:uber_clone/screens/registeration_screen.dart';

void main() async{
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }, (error, stackTrace) {
    //FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dancing Car',
      theme: ThemeData(
        //fontFamily: "Signatra",
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.screenName,
      routes: {
        RegisterationScreen.screenName: (context) => RegisterationScreen(),
        LoginScreen.screenName: (context) => LoginScreen(),
        MainScreen.screenName: (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
