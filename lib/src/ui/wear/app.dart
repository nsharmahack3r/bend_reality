import 'package:bend_reality/src/ui/wear/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WearApp extends StatelessWidget {
  const WearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: Home(),
    );
  }
}