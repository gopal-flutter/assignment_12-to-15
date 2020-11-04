import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'InputTask.dart';
import 'SteamBuilderTask.dart';
import 'component/todayDateTIme.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var date = DateTime.now();
  FirebaseFirestore dbRef = FirebaseFirestore.instance;
  CollectionReference taskCRUD =
      FirebaseFirestore.instance.collection('mywork');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                TodayDateTime(date: date),
                SizedBox(height: 20),
                StreamBuilderTask(dbRef: dbRef, taskCRUD: taskCRUD),
              ],
            ),
            InputTask(),
          ],
        ),
      ),
    );
  }
}
