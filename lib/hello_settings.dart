import 'package:flutter/material.dart';

class HelloSettings extends StatefulWidget {
  @override
  HelloSettingsState createState() => new HelloSettingsState();
}

class HelloSettingsState extends State<HelloSettings> {
  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('Settings'));
  }

  void _confirmOptimismChange(bool value) {}

  Widget buildSettingsPane(BuildContext context) {
    final List<Widget> rows = <Widget>[
      new ListTile(
        leading: const Icon(Icons.thumb_up),
        title: const Text('Everything is awesome'),
        trailing: new Checkbox(
          value: true,
          onChanged: _confirmOptimismChange,
        ),
      ),
      new ListTile(
        leading: const Icon(Icons.accessibility),
        title: const Text('Show semantics overlay'),
        trailing: new Switch(
          value: false,
          onChanged: _confirmOptimismChange,
        ),
      ),
    ];

    return new ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context), body: buildSettingsPane(context));
  }
}
