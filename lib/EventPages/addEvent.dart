import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _firestore = Firestore.instance;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();

  _onClear() {
    setState(() {
      _textEditingController.text = "";
      _textEditingController1.text = "";
      _textEditingController2.text = "";
      _textEditingController3.text = "";
    });
  }

  String titletext;
  String descriptiontext;
  String date;
  String Currentselectedtext;
  String categoryname = "";

  var names = [
    'Others',
    'Marathon',
    'Technical Events',
    'Concerts',
    'Social Events',
    'Stand ups',
  ];
  var currentSelected = 'Others';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('AddEvent')),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('assets/events.png'),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  titletext = value;
                },
              ),
              TextField(
                controller: _textEditingController2,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  descriptiontext = value;
                },
              ),
              TextField(
                controller: _textEditingController3,
                decoration: InputDecoration(
                  labelText: 'Date',
                ),
                onChanged: (value) {
                  date = value;
                },
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Category',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 40),
                  DropdownButton<String>(
                    items: names.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this.currentSelected = newValueSelected;
                        Currentselectedtext = newValueSelected;
                      });
                    },
                    value: currentSelected,
                  ),
                ],
              ),
              FlatButton(
                color: Colors.blue,
                splashColor: Colors.blue,
                onPressed: () {
                  //Navigator.pushNamed(context,initialScreen.id);
                  _firestore.collection('events').add({
                    'Title': titletext,
                    'Category': Currentselectedtext,
                    'Description': descriptiontext,
                    'Date': date,
                  });
                  _onClear();
                },
                child: Text(
                  'Submit',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
