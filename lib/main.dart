import 'package:flutter/material.dart';
import 'home.dart';
import 'category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Codes Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  MyHomePage(title: 'Home'),
        routes: routeMap,
    );
  }
}
