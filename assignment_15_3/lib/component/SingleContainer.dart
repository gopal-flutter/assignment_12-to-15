import 'package:flutter/material.dart';

class SingleContainer extends StatefulWidget {
  final Widget child;
  const SingleContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _SingleContainerState createState() => _SingleContainerState();
}

class _SingleContainerState extends State<SingleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: widget.child,
    );
  }
}
