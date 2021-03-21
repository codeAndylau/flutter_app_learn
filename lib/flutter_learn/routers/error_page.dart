import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key key}) : super(key: key);
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Center(
        child: Text('页面找不到了!!', style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
