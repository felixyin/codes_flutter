import 'package:flutter/material.dart';
import '../category.dart';
import '../source.dart';

class HelloFlutterPage2 extends StatefulWidget {
  static final routeName = '/HelloFlutterPage2';
  _HelloFlutterPage2State createState() => _HelloFlutterPage2State();
}

class _HelloFlutterPage2State extends State<HelloFlutterPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter2'),
      ),
      drawer: CategoryDrawer.getInstance(),
      endDrawer: SourceDrawer.getInstance(),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[Text('hello flutter2.')],
          ),
        ),
      ),
    );
  }
}
