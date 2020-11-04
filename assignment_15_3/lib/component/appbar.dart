import 'package:flutter/material.dart';

AppBar mainPageAppBar() {
  return AppBar(
    title: Text(
      'Browse',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.amber.withOpacity(0.0),
  );
}

AppBar addBookAppBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.close,
          color: Colors.black,
        ),
      )
    ],
    centerTitle: true,
    leading: Icon(
      Icons.arrow_back,
      color: Colors.black,
    ),
    title: Text(
      'Add Book',
      style: TextStyle(color: Colors.black),
    ),
    elevation: 0.0,
    backgroundColor: Colors.orange.withOpacity(0.0),
  );
}

AppBar detailAppBar() {
  return AppBar(
    title: Text(
      'Browse',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.amber.withOpacity(0.0),
    leading: Icon(
      Icons.arrow_back,
      color: Colors.black,
    ),
  );
}
