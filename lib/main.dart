import 'package:ameen/addartist.dart';
import 'package:ameen/addsong.dart';
import 'package:ameen/buysong.dart';
import 'package:ameen/displayartists.dart';
import 'package:ameen/displaysongs.dart';
import 'package:ameen/homepage.dart';
import 'package:ameen/loginpage.dart';
import 'package:ameen/registerpage.dart';
import 'package:ameen/searchartist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==============================User is currently signed out!');
      } else {
        print('=========================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home :
         FirebaseAuth.instance.currentUser == null
             ? const Loginpage()
             : const Homepage()
        );
  }
}
