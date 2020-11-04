import 'package:flutter/material.dart';

import 'InpuNotesPage.dart';

class InputTask extends StatelessWidget {
  const InputTask({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 30),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InpuNotesPage(),
            ),
          ),
        ),
      ),
    );
  }
}
