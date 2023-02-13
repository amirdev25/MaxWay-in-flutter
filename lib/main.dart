import 'package:flutter/material.dart';

import 'data/global/di.dart';
import 'data/ui/HomePage.dart';

void main() {
  setUp();
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
