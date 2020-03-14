import 'package:evently/CategoryPages/medicals.dart';
import 'package:flutter/material.dart';

class Dmedical extends StatefulWidget {
  @override
  _DmedicalState createState() => _DmedicalState();
}

class _DmedicalState extends State<Dmedical> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicals',
      home: Scaffold(
          appBar: AppBar(
            title: Text('medicals'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                  child: Image(
                image: AssetImage(
                  'assets/medicals.jpg',
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
                    MaterialPageRoute(
                      builder: (context) => Medicals(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(
                    child: Text(
                      'all added Medicals',
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
                  'Discover bathroom tile trends, paint colors, organization ideas, and more. See more ideas about Beautiful bathrooms, Small bathroom and Bathroom inspiration',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )),
    );
  }
}
