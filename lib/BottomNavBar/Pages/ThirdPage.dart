import 'package:evently/EventPages/addEvent.dart';
import 'package:evently/EventPages/addPlace.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('assets/thirdpage.png'),
          RaisedButton(
            child: Text(
              "Add Places",
              style: TextStyle(fontSize: 16),
            ),
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPlace()),
              );
            },
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            splashColor: Colors.blueAccent,
          ),
          RaisedButton(
            child: Text(
              "Add Events",
              style: TextStyle(fontSize: 16),
            ),
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEvent()),
              );
            },
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            splashColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
