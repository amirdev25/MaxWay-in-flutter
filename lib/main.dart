import 'package:flutter/material.dart';

void main() {
  runApp(const MaxWayApp());
}

class MaxWayApp extends StatelessWidget {
  const MaxWayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
