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
      sourceCodePath: '01Flutter%E4%B9%8B%E5%88%9D%E5%8D%B0%E8%B1%A1/01hello_flutter.dart',
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
