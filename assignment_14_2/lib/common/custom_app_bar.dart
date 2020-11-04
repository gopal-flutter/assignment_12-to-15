import 'package:assignment_14_2/utils/string.dart';
import 'package:assignment_14_2/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Container(
        padding: EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: Strings.appName,
                    style: TextStyles.appNameTextStyle,
                  ),
                  TextSpan(text: '\n'),
                  TextSpan(
                    text: Strings.TagNAME,
                    style: TextStyles.tagLineTextStyle,
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.menu,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
