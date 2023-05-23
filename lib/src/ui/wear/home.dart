import 'dart:developer';

import 'package:bend_reality/src/core/coordinate.dart';
import 'package:flutter/material.dart';
import 'package:watch_connectivity/watch_connectivity.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //_testWatchConnectivity();

    final watch = WatchConnectivity();

    return Scaffold(
      body: Center(
        child: StreamBuilder<AccelerometerEvent>(
          stream: accelerometerEvents,
          builder : (context, event){

            final AccelerometerEvent? acceleration = event.data;
            if(acceleration == null){
              return Container();
            }

            final data = Coordinate(
                x: acceleration.x,
                y: acceleration.x,
                z: acceleration.x,
            );

            _sendMessage(watch, data);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('x : ${acceleration.x}'),
                Text('y : ${acceleration.y}'),
                Text('z : ${acceleration.z}'),
              ],
            );
          },
        ),
      ),
    );
  }

  void _testWatchConnectivity() async {
    final watch = WatchConnectivity();
    log('isPaired : ${await watch.isPaired}', name: "WATCH");
    log('isReachable : ${await watch.isReachable}', name: "WATCH");
  }

  void _sendMessage(WatchConnectivity watch,Coordinate c) async {
    await watch.sendMessage(c.toMap());
  }
}
