import 'package:flutter/material.dart';

class BasicScene extends StatefulWidget {
  const BasicScene({Key? key}) : super(key: key);

  @override
  State<BasicScene> createState() => _BasicSceneState();
}

class _BasicSceneState extends State<BasicScene> {

  @override
  void initState() {
    super.initState();
    while(true){
      Future.delayed(const Duration(milliseconds: 100)).then((value){
        if(forwardX){
          if(x < 10){
            ++x;
          }
          forwardX = x < 10;
        } else {
          if(x > 10){

            --x;
          }
          forwardX = x > 10;
        }
        //  if (y<10){
        //   ++y;
        // }
      });
    }
  }

  double x = 0;
  double y = 0;
  bool forwardX = true;
  bool forwardY = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Basic Scene"),),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          child: Transform(
            transform: Matrix4.identity()
            ..rotateX(2)
            ..rotateY(4),
            child: Container(
              height: 200,
              width: 400,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
