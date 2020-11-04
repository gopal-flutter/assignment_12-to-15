import 'package:assignment_14_2/utils/text_style.dart';
import 'package:flutter/material.dart';

class ScrollAnimalDetails extends StatefulWidget {
  final List n;
  final List d;
  final List i;

  const ScrollAnimalDetails({Key key, this.i, this.n, this.d})
      : super(key: key);

  @override
  _ScrollAnimalDetailsState createState() => _ScrollAnimalDetailsState();
}

class _ScrollAnimalDetailsState extends State<ScrollAnimalDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.60,
        child: ListView.builder(
          itemCount: widget.n.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.60,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffe65100),
                      image: DecorationImage(
                          image: AssetImage(
                            widget.i[index],
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.n[index],
                    style: TextStyles.headinganimalTextStyle,
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.d[index],
                    style: TextStyles.personaldetailTextStyle,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
