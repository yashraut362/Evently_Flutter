import 'package:evently/CategoryPages/cobblers.dart';
import 'package:evently/CategoryPages/medicals.dart';
import 'package:evently/CategoryPages/teastalls.dart';
import 'package:evently/CategoryPages/washroom.dart';
import 'package:evently/EventPages/reportmistake.dart';
import 'package:evently/detailedPages/dcobblers.dart';
import 'package:evently/detailedPages/dmedicals.dart';
import 'package:evently/detailedPages/dteastalls.dart';
import 'package:evently/detailedPages/dwashroom.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Information about Markers")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Image(
            image: AssetImage(
              'assets/location.png',
            ),
          )),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dmedical()),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 3.0, color: Colors.black),
                    bottom: BorderSide(width: 3.0, color: Colors.black),
                    left: BorderSide(width: 3.0, color: Colors.black),
                    right: BorderSide(width: 3.0, color: Colors.black),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/green.png'),
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'This Marker indicates Medicals',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Tap for more info"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dwashroom(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 3.0, color: Colors.black),
                    bottom: BorderSide(width: 3.0, color: Colors.black),
                    left: BorderSide(width: 3.0, color: Colors.black),
                    right: BorderSide(width: 3.0, color: Colors.black),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/red.png'),
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'This Marker indicates Washrooms',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Tap for more info"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dteastalls(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 3.0, color: Colors.black),
                    bottom: BorderSide(width: 3.0, color: Colors.black),
                    left: BorderSide(width: 3.0, color: Colors.black),
                    right: BorderSide(width: 3.0, color: Colors.black),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/violet.png'),
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'This Marker indicates Tea Stalls',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Tap for more info"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DCobblers()),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 3.0, color: Colors.black),
                    bottom: BorderSide(width: 3.0, color: Colors.black),
                    left: BorderSide(width: 3.0, color: Colors.black),
                    right: BorderSide(width: 3.0, color: Colors.black),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/blue.png'),
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'This Marker indicates Cobblers',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Tap for more info"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportMistake()),
              );
            },
            label: Text('Report Mistakes'),
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
