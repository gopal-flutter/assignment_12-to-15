import 'package:assignment_14_2/common/custom_app_bar.dart';
import 'package:assignment_14_2/screens/second_screen.dart';
import 'package:assignment_14_2/utils/string.dart';
import 'package:assignment_14_2/utils/text_style.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/1.jpg',
            height: height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              CustomAppBar(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, left: 32, right: 32),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: Strings.readyToWatch,
                        style: TextStyles.bigHeadingTextStyle,
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: Strings.readyToWatchDec,
                        style: TextStyles.bodyTextStyle,
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: Strings.Start_Enjoying,
                        style: TextStyles.buttonTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              ),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD3A070),
                ),
                child: Align(
                  alignment: Alignment(-0.4, -0.4),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
