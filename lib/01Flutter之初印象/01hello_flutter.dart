import 'package:flutter/material.dart';
import '../my_scaffold.dart';

class HelloFlutterPage extends StatefulWidget {
  _HelloFlutterPageState createState() => _HelloFlutterPageState();
}

class _HelloFlutterPageState extends State<HelloFlutterPage> {
  @override
  Widget build(BuildContext context) {
    return  MyScaffold(
      context: context,
      sourceCodePath: '01Flutter之初印象/01hello_flutter.dart',
      appBar: AppBar(
        title: Text('HelloFlutter1'),
        actions: <Widget>[],
      ),
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
