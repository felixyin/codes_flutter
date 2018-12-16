import 'package:flutter/material.dart';
import 'home.dart';
import '01Flutter之初印象/01hello_flutter.dart';
import '01Flutter之初印象/test_material_app.dart';

///
/// * 每新讲一课，新的菜单在这里配置：
///
final List<CategoryModel> _cmList = <CategoryModel>[
  CategoryModel(
    'Home',
    routeName: MyHomePage.routeName,
    routeValue: (context) => MyHomePage(title: 'Home'),
  ),
  CategoryModel('章节1 Flutter之初印象', items: [
    CategoryModel(
      'HelloFlutterPage',
      routeName: HelloFlutterPage.routeName,
      routeValue: (context) => HelloFlutterPage(),
    ),
    CategoryModel(
      'TestMaterialAppPage(可返回)',
      routeName: TestMaterialAppPage.routeName,
      routeValue: (context) => TestMaterialAppPage(),
      isAllowBack: true,
    ),
  ]),
];

Map<String, WidgetBuilder> convertCategoryModelToRouteEntry(List<CategoryModel> items) {
  final _routeMap = <String, WidgetBuilder>{};
  for (var cm in items) {
    if (cm.items != null && cm.items.length > 0) {
      final routeMap2 = convertCategoryModelToRouteEntry(cm.items);
      _routeMap.addAll(routeMap2);
    } else {
      _routeMap[cm.routeName] = cm.routeValue;
    }
  }
  return _routeMap;
}

/// * 导出 routeMap给 MaterialApp.route 属性使用
/// * 参考 [MyApp] 16行
final routeMap = convertCategoryModelToRouteEntry(_cmList);

class CategoryDrawer extends StatefulWidget {
  String _title;

  @override
  _CategoryDrawerState createState() {
    return _CategoryDrawerState();
  }

  static CategoryDrawer _self;
  factory CategoryDrawer.getInstance() {
    if (_self == null) {
      _self = CategoryDrawer._internal();
    }
    return _self;
  }
  CategoryDrawer._internal();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  Widget convertCategoryModelToWidget(CategoryModel cm) {
    if (cm.items != null && cm.items.length > 0) {
      return ExpansionTile(
        title: Text(cm.title),
        initiallyExpanded: cm.isClicked,
        onExpansionChanged: (b) => cm.isClicked = b,
        children: cm.items.map(convertCategoryModelToWidget).toList(),
      );
    } else {
      return _buildMenu(context, cm);
    }
  }

  Widget _buildMenu(BuildContext context, CategoryModel cm) {
    return Container(
      color: widget._title == cm.title ? Colors.blueAccent : null,
      child: ListTile(
        title: Text(cm.title),
        onTap: () {
          widget._title = cm.title;
          if (cm.isAllowBack) {
            Navigator.pop(context);
            Navigator.pushNamed(context, cm.routeName);
          } else {
            Navigator.pushReplacementNamed(context, cm.routeName);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('---------');

    final about = ListTile(
      title: Text('关于'),
      onTap: () {
        showAboutDialog(
          applicationName: 'Flutter从入门到精通',
          children: <Widget>[
            Text('公司：青岛前途软件技术有限公司'),
            Text('讲师：尹彬'),
            Text('QQ：1052921694'),
            Text('微信：felixyin'),
            Text('电话：15965585803'),
          ],
          context: context,
        );
      },
    );

    final children = <Widget>[
      Container(
        child: Text('目录'),
      ),
    ];
    // 将配置的菜单树对象转换为折叠菜单Widget
    children.addAll(_cmList.map(convertCategoryModelToWidget).toList());
    children.add(about);

    return Drawer(
      child: Column(
        children: children,
      ),
    );
  }
}

///
/// * 菜单模型，代表一个菜单
class CategoryModel {
  CategoryModel(
    this.title, {
    this.routeName,
    this.items,
    this.isClicked = false,
    this.isAllowBack = false,
    this.routeValue,
  });

  bool isClicked;
  bool isAllowBack;
  final List<CategoryModel> items;
  final String routeName;
  final String title;
  final WidgetBuilder routeValue;
}
