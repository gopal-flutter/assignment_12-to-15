import 'package:flutter/material.dart';

import 'helpers/db_helpers.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.5),
        elevation: 0.0,
        title: Text(
          'All Quotes',
          style: TextStyle(color: Colors.red[300]),
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
                  itemCount: data.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        elevation: 0.8,
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              data[i].shortName.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(data[i].category.toString()),
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
