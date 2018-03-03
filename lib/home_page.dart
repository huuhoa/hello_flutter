import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final pairs;
  RandomWords({Key key, this.pairs}): super(key: key);

  Widget _buildSuggestions(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: this.pairs.length,
        // The itemBuilder callback is called, once per suggested word pairing,
        // and places each suggestion into a ListTile row.
        // For even rows, the function adds a ListTile row for the word pairing.
        // For odd rows, the function adds a Divider widget to visually
        // separate the entries. Note that the divider may be difficult
        // to see on smaller devices.
        itemBuilder: (context, i) {
          return _buildRow(this.pairs[i], context);
        }
    );
  }

  Widget _buildRow(WordPair pair, BuildContext context) {
    final Color dividerColor = Theme.of(context).dividerColor;
    return new DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(color: dividerColor, width: 0.0),
          ),
        ),
        child: new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          onTap: () => _navigateDetail(context, pair.asPascalCase),
        ));
  }

  void _navigateDetail(BuildContext context, String word) {
    Navigator.pushNamed(context, "/word:" + word);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions(context);
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  final _suggestions = <WordPair>[];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _suggestions.addAll(generateWordPairs().take(1));
    });
  }

  void _navigateSetting() {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings), onPressed: _navigateSetting)
        ],
      ),
      body: new RandomWords(pairs: _suggestions),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'show the tooltip when touch and hold',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
