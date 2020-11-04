import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Created tasks',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Text(
            'Completed tasks',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
