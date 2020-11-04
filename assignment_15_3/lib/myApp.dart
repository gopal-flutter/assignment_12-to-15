import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'FloatingButton.dart';
import 'FullDeatils.dart';
import 'component/appbar.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseFirestore dbRef = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: mainPageAppBar(),
        floatingActionButton: FloatingButton(),
        body: StreamBuilder(
          stream: dbRef.collection('authorBook').snapshots(),
          builder: (context, ss) {
            if (ss.hasData) {
              if (ss.data != null) {
                var data = ss.data.documents;

                return Container(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FullDeatils(
                                aboutauthor: data[i]['aboutAuthor'],
                                aboutbook: data[i]['aboutBook'],
                                authorname: data[i]['authorName'],
                                bookname: data[i]['bookName'],
                                imagelink: data[i]['imageLink'],
                                rating: data[i]['rating'],
                                year: data[i]['publishYear'],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 15),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  height: size.height * 0.30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 80, top: 20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[i]['bookName'],
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  size: 17,
                                                  color: Colors.yellow),
                                              Icon(Icons.star,
                                                  size: 17,
                                                  color: Colors.yellow),
                                              Icon(Icons.star,
                                                  size: 17,
                                                  color: Colors.yellow),
                                              Icon(Icons.star,
                                                  size: 17,
                                                  color: Colors.yellow),
                                              Icon(Icons.star,
                                                  size: 17,
                                                  color: Colors.yellow),
                                              SizedBox(width: 15),
                                              Text(
                                                data[i]['rating'].toString(),
                                                style: TextStyle(fontSize: 17),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            data[i]['aboutBook'],
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                wordSpacing: 3),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              child: Card(
                                child: Container(
                                  height: size.height * 0.25,
                                  width: size.width * 0.30,
                                  child: Image.network(
                                    data[i]['imageLink'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, top: 0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  iconSize: 15,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete ?'),
                                          content: Text(
                                              'Are you sure to delete this Task ?'),
                                          actions: [
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);

                                                dbRef
                                                    .collection('authorBook')
                                                    .doc(data[i].id)
                                                    .delete();
                                              },
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                          elevation: 24,
                                        );
                                      },
                                    );
                                  },
                                  color: Colors.red,
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text('No Data...');
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
