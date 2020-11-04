import 'package:assignment_14_1/All_list.dart/List.dart';
import 'package:assignment_14_1/helpers/db_helpers.dart';
import 'package:flutter/material.dart';
import 'FullQuotePage.dart';

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  Set<String> savedWords = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Best Friends Quotes',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DBHelper.db.getQuote(),
        builder: (context, ss) {
          if (ss.hasData) {
            if (ss.hasData != null) {
              var data = ss.data;
              return ListView.builder(
                  itemCount: 17,
                  itemBuilder: (BuildContext context, i) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullQuotePage(
                                        finalQuotes: data[i].quotes,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    child: Text(
                                      data[i].quotes.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: done[i]
                                          ? Icon(
                                              Icons.done_all,
                                              color: Colors.grey,
                                            )
                                          : Icon(
                                              Icons.done_all_outlined,
                                              color: Colors.yellow,
                                            ),
                                      onPressed: () {
                                        done[i] = !done[i];
                                        setState(() {
                                          done[i]
                                              ? Scaffold.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    content: Text('UnRead'),
                                                  ),
                                                )
                                              : Scaffold.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    content: Text('Read'),
                                                  ),
                                                );
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: favorite[i]
                                          ? Icon(
                                              Icons.grade_outlined,
                                              color: Colors.grey,
                                            )
                                          : Icon(
                                              Icons.grade,
                                              color: Colors.yellow,
                                            ),
                                      onPressed: () {
                                        favorite[i] = !favorite[i];
                                        setState(() {
                                          favorite[i]
                                              ? Scaffold.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    content: Text('UnFavorite'),
                                                  ),
                                                )
                                              : Scaffold.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    content: Text('Favorite'),
                                                  ),
                                                );
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: copy[i]
                                          ? Icon(
                                              Icons.file_copy_outlined,
                                              color: Colors.grey,
                                            )
                                          : Icon(
                                              Icons.file_copy_outlined,
                                              color: Colors.grey,
                                            ),
                                      onPressed: () {
                                        copy[i] = !copy[i];
                                        setState(() {
                                          copy[i]
                                              ? Scaffold.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    content: Text('Copy'),
                                                  ),
                                                )
                                              : Scaffold.of(context)
                                                  .showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    content: Text('Copy'),
                                                  ),
                                                );
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: Text('No Data...'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
