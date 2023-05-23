import 'package:flutter/material.dart';
import 'package:bend_reality/src/ui/hand_held/scenes/basic.dart';

class HandHeldApp extends StatelessWidget {
  const HandHeldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.blue,
      //home: const Home(),
      home: BasicScene(),
    );
  }
}