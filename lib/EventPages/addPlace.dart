import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _firestore = Firestore.instance;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  _onClear() {
    setState(() {
      _textEditingController.text = "";
      _textEditingController1.text = "";
      _textEditingController2.text = "";
    });
  }

  String titletext;
  String descriptiontext;
  String Currentselectedtext;
  String categoryname = "";
  var names = [
    'Others',
    'Washrooms',
    'Tea Stall',
    'Cobblers',
    'Tourist places',
  ];
  var currentSelected = 'Others';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('AddPlace')),
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
                  _firestore.collection('places').add({
                    'Title': titletext,
                    'Category': Currentselectedtext,
                    'Description': descriptiontext,
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
