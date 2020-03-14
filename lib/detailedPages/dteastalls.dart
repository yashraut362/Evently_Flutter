import 'package:evently/CategoryPages/teastalls.dart';
import 'package:flutter/material.dart';

class Dteastalls extends StatefulWidget {
  @override
  _DteastallsState createState() => _DteastallsState();
}

class _DteastallsState extends State<Dteastalls> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'teastalls',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Tea Stall'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                  child: Image(
                image: AssetImage(
                  'assets/teastall.jpg',
                ),
              )),
              SizedBox(
                width: 100.0,
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Teastalls()),
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(
                    child: Text(
                      'all added TeaStalls',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 20.0,
              ),
              Container(
                child: Text(
                  'Discover tea-stall tile trends, paint colors, organization ideas, and more. See more ideas about Beautiful bathrooms, Small bathroom and Bathroom inspiration',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )),
    );
  }
}
