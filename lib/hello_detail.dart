import 'package:flutter/material.dart';

class HelloDetailPage extends StatelessWidget {
  final String word;

  HelloDetailPage({Key key, this.word}) : super(key: key);

  Widget _buildAppBar(BuildContext context) {
    return new AppBar(
        title: const Text('Detail')
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(context),
      body: new Center(
        child: new Text(word, style: Theme.of(context).textTheme.display1,),
      )
    );
  }
}
