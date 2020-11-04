import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayDateTime extends StatelessWidget {
  const TodayDateTime({
    Key key,
    @required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          Text(
            "${DateFormat('EEEE').format(date)},",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          Text(
            "\t\t${date.day.toString()}",
            style: TextStyle(fontSize: 35),
          ),
          Text(
            "\t ${DateFormat('LLL').format(date)}",
            style: TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }
}
