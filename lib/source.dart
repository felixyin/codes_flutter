import 'package:flutter/material.dart';
import 'home.dart';
import '01Flutter之初印象/01hello_flutter.dart';
import '01Flutter之初印象/01hello_flutter2.dart';

final routeMap = <String, WidgetBuilder>{
  MyHomePage.routerName: (context) => MyHomePage(title: 'Home'),
  HelloFlutterPage.routeName: (context) => HelloFlutterPage(),
  HelloFlutterPage2.routeName: (context) => HelloFlutterPage2(),
};

class SourceDrawer extends StatelessWidget {
  bool _ze01 = false;
  bool _ze02 = false;

  @override
  Widget build(BuildContext context) {
    print('---------');

    

    final z02 = ExpansionTile(
      title: Text('章节4 使用设备和SDK API'),
      initiallyExpanded: _ze02,
      onExpansionChanged: (b) => _ze02 = b,
      children: <Widget>[
        _buildExampleMenu(context, 'testFlutter2', HelloFlutterPage2.routeName),
      ],
    );

    final z01 = ExpansionTile(
      title: Text('章节1 Flutter之初印象'),
      initiallyExpanded: _ze01,
      onExpansionChanged: (b) => _ze01 = b,
      children: <Widget>[
        _buildExampleMenu(context, 'Hello Flutter', HelloFlutterPage.routeName),
      ],
    );

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('源码'),
          ),
          z01,
          z02,
        ],
      ),
    );
  }

  ListTile _buildExampleMenu(BuildContext context, String title, String routeName) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Navigator.pop(context);
        Navigator.pushReplacementNamed(context, routeName);
      },
    );
  }

  static SourceDrawer _self;
  factory SourceDrawer.getInstance() {
    if (_self == null) {
      _self = SourceDrawer._internal();
    }
    return _self;
  }
  SourceDrawer._internal();
}
