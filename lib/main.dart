import 'package:flutter/material.dart';

import 'Separators/Calculator1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator IMC', //Indice de masa corporal
      home: Calculator1(),
    );
  }
}

