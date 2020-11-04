import 'package:flutter/material.dart';

import 'component/appbar.dart';

class FullDeatils extends StatefulWidget {
  final String bookname;
  final String imagelink;
  final String authorname;
  final String aboutauthor;
  final String aboutbook;
  final int rating;
  final int year;

  const FullDeatils({
    Key key,
    this.bookname,
    this.imagelink,
    this.authorname,
    this.aboutauthor,
    this.aboutbook,
    this.rating,
    this.year,
  }) : super(key: key);
  @override
  _FullDeatilsState createState() => _FullDeatilsState();
}

class _FullDeatilsState extends State<FullDeatils> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: detailAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30, bottom: 30, top: 150),
            child: Card(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.bookname,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, size: 20, color: Colors.yellow),
                          Icon(Icons.star, size: 20, color: Colors.yellow),
                          Icon(Icons.star, size: 20, color: Colors.yellow),
                          Icon(Icons.star, size: 20, color: Colors.yellow),
                          Icon(Icons.star, size: 20, color: Colors.yellow),
                          SizedBox(width: 20),
                          Text(
                            "${widget.rating}.0".toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Author Name : ${widget.authorname}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'publish Year : ${widget.year}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.aboutauthor,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 9,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              wordSpacing: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              color: Colors.red,
              height: size.height * 0.30,
              width: size.width * 0.40,
              child: Image.network(
                widget.imagelink,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
