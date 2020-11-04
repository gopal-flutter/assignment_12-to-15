import 'package:assignment_15_2/MyApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InpuNotesPage extends StatefulWidget {
  @override
  _InpuNotesPageState createState() => _InpuNotesPageState();
}

class _InpuNotesPageState extends State<InpuNotesPage> {
  final _inputText = GlobalKey<FormState>();
  TextEditingController inputText = TextEditingController();
  var newTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Form(
                key: _inputText,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.tab),
                    labelText: "Enter New Task",
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  controller: inputText,
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      newTask = val;
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
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Cancel'),
                    onPressed: noInput,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Add'),
                    onPressed: addData,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  addData() async {
    if (_inputText.currentState.validate()) {
      _inputText.currentState.save();
      print(newTask);
      CollectionReference mywork =
          FirebaseFirestore.instance.collection('mywork');
      mywork
          .add({
            'check': false,
            'task': newTask,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print('Failed to add user: $error'));
    }
    Navigator.of(context).pop();
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
