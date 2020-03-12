import 'package:evently/Authentication/pages/root_page.dart';
import 'package:evently/Authentication/services/authentication.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      home: Scaffold(
        body: new RootPage(auth: new Auth()),
      ),
    );
  }
}
