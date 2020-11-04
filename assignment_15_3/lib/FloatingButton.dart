import 'package:flutter/material.dart';

import 'AddAuthor.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({
    Key key,
  }) : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => AddAuthor(),
        ),
      ),
    );
  }
}
