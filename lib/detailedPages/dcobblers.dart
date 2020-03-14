import 'package:evently/CategoryPages/cobblers.dart';
import 'package:flutter/material.dart';

class DCobblers extends StatefulWidget {
  @override
  _DCobblersState createState() => _DCobblersState();
}

class _DCobblersState extends State<DCobblers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobblers',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cobblers'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                  child: Image(
                image: AssetImage(
                  'assets/cobblers.jpg',
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
                    MaterialPageRoute(builder: (context) => Cobblers()),
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(
                      child: Text(
                    'all added Cobblers',
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
