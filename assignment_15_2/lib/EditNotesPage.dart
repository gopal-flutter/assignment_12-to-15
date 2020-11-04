import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'MyApp.dart';

class EditNotesPage extends StatefulWidget {
  final String taskid, taskValue;

  EditNotesPage({Key key, @required this.taskid, this.taskValue})
      : super(key: key);
  @override
  _EditNotesPageState createState() => _EditNotesPageState();
}

class _EditNotesPageState extends State<EditNotesPage> {
  final _inputEditText = GlobalKey<FormState>();
  TextEditingController inputEditText = TextEditingController();
  var updateTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Form(
                key: _inputEditText,
                child: TextFormField(
                  initialValue: widget.taskValue,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.tab),
                    labelText: "Update Task",
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Please enter update text';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      updateTask = val;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Cancel'),
                    onPressed: noInput,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Update'),
                    onPressed: updateData,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateData() async {
    if (_inputEditText.currentState.validate()) {
      _inputEditText.currentState.save();
      print(updateTask);
      CollectionReference mywork =
          FirebaseFirestore.instance.collection('mywork');
      mywork
          .doc(widget.taskid)
          .update({
            'check': false,
            'task': updateTask,
          })
          .then((value) => print('user upadte'))
          .catchError((error) => print('Failed to update user: $error'));
      Navigator.of(context).pop();
    }
  }

  noInput() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
        (route) => false);
  }
}
