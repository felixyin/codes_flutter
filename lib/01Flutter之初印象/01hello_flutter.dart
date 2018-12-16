import 'package:flutter/material.dart';
import '../category.dart';
import '../source.dart';

class HelloFlutterPage extends StatefulWidget {
  static final routeName = '/HelloFlutterPage';
  _HelloFlutterPageState createState() => _HelloFlutterPageState();
}

class _HelloFlutterPageState extends State<HelloFlutterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter'),
      ),
      drawer: CategoryDrawer.getInstance(),
      endDrawer: SourceDrawer.getInstance(),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[Text('hello flutter.')],
          ),
        ),
      ),
    );
  }
}
