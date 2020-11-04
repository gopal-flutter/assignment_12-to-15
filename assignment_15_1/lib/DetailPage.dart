import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.email, this.uid, this.createTime, this.signInTime);
  final String email;
  final String uid;
  final DateTime createTime;
  final DateTime signInTime;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle allFont = TextStyle(color: Colors.black, fontSize: 18);
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST ME"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Email: ${widget.email}",
              style: allFont,
            ),
            SizedBox(height: 20),
            Text(
              'UID: ${widget.uid}',
              style: allFont,
            ),
            SizedBox(height: 20),
            Text(
              'Creation Time: ${widget.createTime}',
              style: allFont,
            ),
            SizedBox(height: 20),
            Text(
              'Last Sign In Time: ${widget.signInTime}',
              style: allFont,
            ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: size.width * 0.8,
              height: size.height * 0.07,
              child: RaisedButton(
                onPressed: () async {
                  await auth.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/MyAppSignUpPage', (route) => false);
                },
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29.0),
                ),
                child: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
