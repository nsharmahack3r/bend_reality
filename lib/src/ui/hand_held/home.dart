// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:bend_reality/src/core/coordinate.dart';
import 'package:flutter/material.dart';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coordinateProvider = StateProvider<Coordinate?>((ref) => null);

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  final int bgMotionSensitivity = 6;
  final int bgMotionSensitivityL2 = 8;
  final int planetMotionSensitivity = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = WatchConnectivity();
    final size = MediaQuery.of(context).size;

    final coordinate = ref.watch(coordinateProvider);

    watch.messageStream.listen((event) {
      final c = Coordinate.fromMap(event);

      ref.read(coordinateProvider.notifier).update((state){
        if(state!=null){
          if((state.x - c.x).abs() > 1.0) {
            log('State Updated', name: 'XYZ');
            return c;
          }
          if((state.y - c.y).abs() > 1.0) {
            log('State Updated', name: 'XYZ');
            return c;
          }
          if((state.z - c.z).abs() > 1.0) {
            log('State Updated', name: 'XYZ');
            return c;
          }
          return state;
        }
        return c;
      });
    });

    if(coordinate == null){
      return const Scaffold(
        body: Center(
          child: Text(
            "Watch App Not Connected",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          //top: coordinate.y * bgMotionSensitivityL2,
          //bottom: coordinate.y * -bgMotionSensitivityL2,
          right: coordinate.x * -bgMotionSensitivityL2,
          left: coordinate.x * bgMotionSensitivityL2,
          child: Align(
            child: Image.asset(
              "assets/images/stars_layer_2.png",
              height: size.height,
              fit: BoxFit.cover,
              //fit: BoxFit.fitHeight,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          //top: coordinate.y * bgMotionSensitivity,
          //bottom: coordinate.y * -bgMotionSensitivity,
          right: coordinate.x * -bgMotionSensitivity,
          left: coordinate.x * bgMotionSensitivity,
          child: Align(
            child: Image.asset(
              "assets/images/stars_layer_1.png",
              height: size.height,
              fit: BoxFit.cover,
              //fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            "assets/images/earth.png",
            width: 250,
            height: 250,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
