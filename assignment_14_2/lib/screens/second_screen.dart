import 'package:assignment_14_2/common/category_container.dart';
import 'package:assignment_14_2/common/custom_app_bar.dart';
import 'package:assignment_14_2/utils/list_animal.dart';
import 'package:assignment_14_2/utils/string.dart';
import 'package:assignment_14_2/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'DetailPage.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB98959),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 24),
                child: Text(
                  Strings.chooseAPlan,
                  style: TextStyles.headingTextStyle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.799,
                child: ListView.builder(
                  itemCount: category.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            imagePath: images[i],
                            nameCategory: category[i],
                            allDetailsName: all[i]['AnimalName'],
                            allDetailsDec: all[i]['AnimalDesc'],
                            allDetailsImage: all[i]['AnimalImages'],
                          ),
                        ),
                      ),
                      child: CategoryContainer(
                        text: category[i],
                        total: total[i],
                        imagePath: images[i],
                        icon: icon[i],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
