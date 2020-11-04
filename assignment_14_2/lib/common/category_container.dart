import 'package:assignment_14_2/utils/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatefulWidget {
  final String text, imagePath;
  final String total;
  final icon;

  const CategoryContainer(
      {Key key, this.text, this.imagePath, this.total, this.icon})
      : super(key: key);

  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Color(0xFFB98959).withOpacity(0.3),
            BlendMode.srcATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text, style: TextStyles.categoryContainerTextStyle),
            Column(
              children: [
                FaIcon(
                  widget.icon,
                  color: Colors.white.withOpacity(0.8),
                  size: 30,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(widget.total.toString(),
                    style: TextStyles.categoryContainerTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
