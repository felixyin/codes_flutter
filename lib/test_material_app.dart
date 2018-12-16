import 'package:flutter/material.dart';
import 'my_scaffold.dart';
import 'category.dart';

class TestMaterialAppPage extends StatefulWidget {
  _TestMaterialAppPageState createState() => _TestMaterialAppPageState();
}

class _TestMaterialAppPageState extends State<TestMaterialAppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: routeMap,
      home: MyScaffold(
        context: context,
        sourceCodePath: 'test_material_app.dart',
        appBar: AppBar(
          title: Text('Test APP....'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[Text('Test APP.')],
            ),
          ),
        ),
      ),
    );
  }
}
