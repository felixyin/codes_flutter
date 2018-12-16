import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'category.dart';

///
///  在Scaffold基础上增加了，查看源码的按钮和课时切换菜单（菜单在Drawer面板中）
///
/// ```dart
///  MyScaffold(
///     context: context,
///     sourceCodePath: '01Flutter%E4%B9%8B%E5%88%9D%E5%8D%B0%E8%B1%A1/01hello_flutter.dart',
///     appBar: AppBar(
///       title: Text(widget.title),
///       actions: <Widget>[],
///     ),
///     body: Center(
///       child: Column(
///         mainAxisAlignment: MainAxisAlignment.center,
///         children: <Widget>[
///           Text(
///             'You have pushed the button this many times:',
///           ),
///           Text(
///             '$_counter',
///             style: Theme.of(context).textTheme.display1,
///           ),
///         ],
///       ),
///     ),
///     floatingActionButton: FloatingActionButton(
///       onPressed: _incrementCounter,
///       tooltip: 'Increment',
///       child: Icon(Icons.add),
///     ),
///   );
/// }
/// ```
///
class MyScaffold extends Scaffold {
  //// Creates a visual scaffold for material design widgets.
  MyScaffold({
    Key key,
    this.context,
    this.sourceCodePath,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding = true,
    this.primary = true,
  })  : assert(primary != null),
        assert(appBar != null),

        /// assert(drawer == null),
        assert(context != null),
        assert(sourceCodePath != null),
        super() {
    this.drawer = CategoryDrawer.getInstance();
    if (appBar is AppBar) {
      final ab = appBar as AppBar;
      assert(ab.actions != null);
      ab.actions.add(IconButton(
        icon: Icon(Icons.code),
        onPressed: () {
          Route<Object> route = MaterialPageRoute(builder: (BuildContext context) {
            String codeUrl =
                'https://github.com/felixyin/codes_flutter/blob/master/lib/$sourceCodePath';
            return WebviewScaffold(
              url: codeUrl,
              appBar: new AppBar(
                title: new Text("Source Code"),
                actions: <Widget>[],
              ),
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Container(
                color: Colors.redAccent,
                child: const Center(
                  child: Text('Waiting.....'),
                ),
              ),
            );
          });
          Navigator.push(context, route);
        },
      ));
    }
    this.body = WillPopScope(onWillPop: () => _onWillPop(context), child: this.body);
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('提示'),
                content: new Text('您确认要关闭应用？'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('取消'),
                  ),
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text('确定'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  final BuildContext context;

  final String sourceCodePath;

  final PreferredSizeWidget appBar;

  Widget body;

  final Widget floatingActionButton;

  final FloatingActionButtonLocation floatingActionButtonLocation;

  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  final List<Widget> persistentFooterButtons;

  Widget drawer;

  final Widget endDrawer;

  final Color backgroundColor;

  final Widget bottomNavigationBar;

  final Widget bottomSheet;

  final bool resizeToAvoidBottomPadding;

  final bool primary;
}
