import 'package:assignment_14_2/common/custom_app_bar.dart';
import 'package:assignment_14_2/utils/list_animal.dart';
import 'package:assignment_14_2/utils/string.dart';
import 'package:assignment_14_2/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ScrollAnimalDetails.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;
  final String nameCategory;
  final List allDetailsName;
  final List allDetailsImage;
  final List allDetailsDec;

  const DetailPage(
      {Key key,
      this.imagePath,
      this.nameCategory,
      this.allDetailsName,
      this.allDetailsImage,
      this.allDetailsDec})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    var de = DetailPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb98959),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.40,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.srcATop,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomAppBar(),
                      SizedBox(height: 50),
                      Expanded(
                        child: Text(
                          widget.nameCategory,
                          style: TextStyles.detailTextStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.65,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: Color(0xffb98959),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Text(Strings.relatedforyou,
                          style: TextStyles.buttonTextStyle),
                    ),
                    ScrollAnimalDetails(
                      i: widget.allDetailsImage,
                      d: widget.allDetailsDec,
                      n: widget.allDetailsName,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Text(Strings.quickCategory,
                          style: TextStyles.buttonTextStyle),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView.builder(
                        itemCount: icon.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd3a070),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FaIcon(
                                      icon[i],
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  cate[i],
                                  style: TextStyles.cateTextStyle,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
