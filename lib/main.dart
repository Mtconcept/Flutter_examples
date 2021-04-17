import 'package:flutter/material.dart';
import 'package:flutter_test_project/line_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: LineChartSample(),
    );
  }
}
