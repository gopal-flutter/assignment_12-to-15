import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'EditNotesPage.dart';
import 'TaskDetails.dart';

class StreamBuilderTask extends StatefulWidget {
  const StreamBuilderTask({
    Key key,
    @required this.dbRef,
    @required this.taskCRUD,
  }) : super(key: key);

  final FirebaseFirestore dbRef;
  final CollectionReference taskCRUD;

  @override
  _StreamBuilderTaskState createState() => _StreamBuilderTaskState();
}

class _StreamBuilderTaskState extends State<StreamBuilderTask> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: widget.dbRef.collection('mywork').snapshots(),
        builder: (context, ss) {
          if (ss.hasData) {
            if (ss.data != null) {
              var data = ss.data.documents;
              int completeTask = 0;
              List<bool> checkList = [];
              for (var i = 0; i < data.length; i++) {
                checkList.add(data[i]['check']);
                if (data[i]['check'] == true) {
                  completeTask++;
                }
              }
              print(completeTask);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.length.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          completeTask.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TaskDetails(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, i) {
                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: checkList[i],
                              onChanged: (value) => setState(() {
                                checkList[i] = value;
                                print('value=====$value');
                                widget.taskCRUD
                                    .doc(data[i].id)
                                    .update({
                                      'check': value,
                                    })
                                    .then((value) => print('user upadte'))
                                    .catchError((error) =>
                                        print('Failed to update user: $error'));
                              }),
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  color: Colors.grey,
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    var id = data[i].id;
                                    var task = data[i]['task'];
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditNotesPage(
                                            taskid: id, taskValue: task),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    var id = data[i].id;
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

                                                widget.taskCRUD
                                                    .doc(id)
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
                                ),
                              ],
                            ),
                            title: Container(
                              child: Text(
                                data[i]['task'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Text('No Data....');
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
