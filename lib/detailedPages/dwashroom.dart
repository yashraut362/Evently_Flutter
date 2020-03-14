import 'package:evently/CategoryPages/washroom.dart';
import 'package:flutter/material.dart';

class Dwashroom extends StatefulWidget {
  @override
  _DwashroomState createState() => _DwashroomState();
}

class _DwashroomState extends State<Dwashroom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'washroom',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Washroom'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                  child: Image(
                image: AssetImage(
                  'assets/washroom.jpg',
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
                    MaterialPageRoute(builder: (context) => Washrooms()),
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(
                      child: Text(
                    'all added Washrooms',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 20.0,
              ),
              Container(
                child: Text(
                  'Discover bathroom tile trends, paint colors, organization ideas, and more. See more ideas about Beautiful bathrooms, Small bathroom and Bathroom inspiration',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )),
    );
  }
}
