import 'package:flutter/material.dart';

import './injections.dart' as di;

void main() async {
  // initialize dependencies injections
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: Center(
          child: Text('PoliteCoder DDD CRUD Test'),
        ),
      ),
    );
  }
}
