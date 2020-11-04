import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'MyAppSignInPage.dart';
import 'MyAppSignUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(
    MaterialApp(
      title: 'firebase.1.1',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SpalashScreen(),
        '/MyAppSignUpPage': (context) => MyAppSignUpPage(),
        '/MyAppSignInPage': (context) => MyAppSignInPage(),
        // '/DetailPage': (context) => DetailPage(),
      },
    ),
  );
}

class SpalashScreen extends StatefulWidget {
  @override
  _SpalashScreenState createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyAppSignUpPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/1.png'),
              SizedBox(height: 20),
              Text(
                'Test Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )),
    );
  }
}
