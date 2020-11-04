import 'package:flutter/material.dart';
import 'All_list.dart/List.dart';
import 'package:share/share.dart';

class FullQuotePage extends StatefulWidget {
  final String finalQuotes;

  const FullQuotePage({Key key, this.finalQuotes}) : super(key: key);

  @override
  _FullQuotePageState createState() => _FullQuotePageState();
}

class _FullQuotePageState extends State<FullQuotePage> {
  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(widget.finalQuotes,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  String _myImage = "assets/image/1.jpg";
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              _myImage,
              fit: BoxFit.fill,
              color: Colors.black.withOpacity(1.0),
              colorBlendMode: BlendMode.softLight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.80,
                  child: Text(
                    '"${widget.finalQuotes}"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: _color,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.filter_rounded,
                        color: Colors.white,
                      ),
                      onPressed: _onClick,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.font_download_rounded,
                        color: Colors.white,
                      ),
                      onPressed: _onClickColor,
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: finalCopy
                            ? Icon(
                                Icons.file_copy_outlined,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.file_copy_outlined,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          finalCopy = !finalCopy;
                          setState(() {
                            finalCopy
                                ? Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 400),
                                      content: Text('Copy'),
                                    ),
                                  )
                                : Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 400),
                                      content: Text('Copy'),
                                    ),
                                  );
                          });
                        },
                      ),
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            share(context);
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: finalFavorite
                            ? Icon(
                                Icons.grade_outlined,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.grade,
                                color: Colors.yellow,
                              ),
                        onPressed: () {
                          finalFavorite = !finalFavorite;
                          setState(() {
                            finalFavorite
                                ? Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 400),
                                      content: Text('UnFavorite'),
                                    ),
                                  )
                                : Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 400),
                                      content: Text('Favorite'),
                                    ),
                                  );
                          });
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onClick() {
    setState(() {
      if (_myImage == 'assets/image/1.jpg') {
        _myImage = 'assets/image/2.jpg';
      } else if (_myImage == 'assets/image/2.jpg') {
        _myImage = 'assets/image/3.jpg';
      } else if (_myImage == 'assets/image/3.jpg') {
        _myImage = 'assets/image/4.jpg';
      } else if (_myImage == 'assets/image/4.jpg') {
        _myImage = 'assets/image/5.png';
      } else if (_myImage == 'assets/image/5.png') {
        _myImage = 'assets/image/6.jpeg';
      } else if (_myImage == 'assets/image/6.jpeg') {
        _myImage = 'assets/image/7.jpeg';
      } else if (_myImage == 'assets/image/7.jpeg') {
        _myImage = 'assets/image/8.jpg';
      } else if (_myImage == 'assets/image/8.jpg') {
        _myImage = 'assets/image/9.jpg';
      } else if (_myImage == 'assets/image/9.jpg') {
        _myImage = 'assets/image/10.jpg';
      } else if (_myImage == 'assets/image/10.jpg') {
        _myImage = 'assets/image/1.jpg';
      }
    });
  }

  void _onClickColor() {
    setState(() {
      if (_color == Colors.white) {
        _color = Colors.red;
      } else if (_color == Colors.red) {
        _color = Colors.green;
      } else if (_color == Colors.green) {
        _color = Colors.pink;
      } else if (_color == Colors.pink) {
        _color = Colors.purple;
      } else if (_color == Colors.purple) {
        _color = Colors.black;
      } else if (_color == Colors.black) {
        _color = Colors.deepOrange;
      } else if (_color == Colors.deepOrange) {
        _color = Colors.white;
      }
    });
  }
}
