import 'package:flutter/material.dart';
import 'hello_settings.dart';
import 'home_page.dart';
import 'hello_detail.dart';

void main() => runApp(new HelloApp());

class HelloApp extends StatefulWidget {
  @override
  HelloAppState createState() => new HelloAppState();
}

class HelloAppState extends State<HelloApp> {
  Route<Null> _getRoute(RouteSettings settings) {
    // Routes, by convention, are split on slashes, like filesystem paths.
    final List<String> path = settings.name.split('/');
    // We only support paths that start with a slash, so bail if
    // the first component is not empty:
    if (path[0] != '') {
      return null;
    }

    // If the path is "/word:..." then show a stock page for the
    // specified stock symbol.
    if (!path[1].startsWith('word:')) {
      // The other paths we support are in the routes table.
      return null;
    }
    // We don't yet support subpages of a stock, so bail if there's
    // any more path components.
    if (path.length != 2) {
      return null;
    }

    // Extract the symbol part of "word:..." and return a route
    // for that symbol.
    final String symbol = path[1].substring(5);
    return new MaterialPageRoute<Null>(
      settings: settings,
      builder: (BuildContext context) => new HelloDetailPage(word: symbol),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) =>
            new MyHomePage(title: 'Flutter Hello World'),
        '/settings': (BuildContext context) => new HelloSettings()
      },
      onGenerateRoute: _getRoute,
    );
  }
}
