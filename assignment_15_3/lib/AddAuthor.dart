import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'component/SingleContainer.dart';
import 'component/appbar.dart';

class AddAuthor extends StatefulWidget {
  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  TextEditingController _bookName = TextEditingController();
  TextEditingController _imageAuthor = TextEditingController();
  TextEditingController _aboutAuthor = TextEditingController();
  TextEditingController _authorName = TextEditingController();
  TextEditingController _aboutBook = TextEditingController();
  TextEditingController _ratingBook = TextEditingController();
  TextEditingController _bookYear = TextEditingController();
  final _authorBookKey = GlobalKey<FormState>();
  var bookname, imagelink, authorname, aboutauthor, aboutbook, rating, year;

  @override
  void dispose() {
    super.dispose();
    _bookName.dispose();
    _imageAuthor.dispose();
    _aboutAuthor.dispose();
    _aboutBook.dispose();
    _ratingBook.dispose();
    _bookYear.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addBookAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _authorBookKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        bookname = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter Book name';
                      }
                      return null;
                    },
                    controller: _bookName,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.book,
                      ),
                      hintText: 'Book Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        imagelink = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter Image URL';
                      }
                      return null;
                    },
                    controller: _imageAuthor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.image,
                      ),
                      hintText: 'Image Link',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        authorname = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter Author Name';
                      }
                      return null;
                    },
                    controller: _authorName,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                      ),
                      hintText: 'Author Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        aboutauthor = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter About Author';
                      }
                      return null;
                    },
                    maxLines: 6,
                    controller: _aboutAuthor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.create,
                      ),
                      hintText: 'About Author',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        aboutbook = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter About Book';
                      }
                      return null;
                    },
                    maxLines: 6,
                    controller: _aboutBook,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.local_library,
                      ),
                      hintText: 'About Book',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        rating = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter Rating';
                      }
                      return null;
                    },
                    controller: _ratingBook,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.star,
                      ),
                      hintText: 'Rating',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SingleContainer(
                  child: TextFormField(
                    onSaved: (val) {
                      setState(() {
                        year = val;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter Year';
                      }
                      return null;
                    },
                    controller: _bookYear,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                      hintText: 'Publish year',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    child: Text(
                      'Finish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.black,
                  onPressed: addData,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addData() async {
    if (_authorBookKey.currentState.validate()) {
      _authorBookKey.currentState.save();
      // print(newTask);
      CollectionReference mywork =
          FirebaseFirestore.instance.collection('authorBook');
      mywork
          .add({
            'aboutAuthor': aboutauthor,
            'aboutBook': aboutbook,
            'authorName': authorname,
            'bookName': bookname,
            'imageLink': imagelink,
            'publishYear': year,
            'rating': rating,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print('Failed to add user: $error'));
    }
    Navigator.of(context).pop();
  }
}
