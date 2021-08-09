

import 'package:flutter/material.dart';
import 'main.dart';

class DisplayPage extends StatefulWidget {
  final String displayText;
  final void Function() doOnInit;

  const DisplayPage({
    @required this.displayText,
    @required this.doOnInit,
    Key key,
  }) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  void initState() {
    super.initState();
    widget.doOnInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            widget.displayText,
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}