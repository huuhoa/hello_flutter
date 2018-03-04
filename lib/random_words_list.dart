import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsList extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final pairs;
  RandomWordsList({Key key, this.pairs}) : super(key: key);

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
        });
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

