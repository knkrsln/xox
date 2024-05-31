import 'package:flutter/material.dart';

class RobotPlayer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RobotPlayerState();
  }
  
}
class RobotPlayerState extends State<RobotPlayer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Robota Karşı Oyun"),
      ),
      body: const Column(
        children: [
          Text("Hazırlık Aşamasında")
        ],
      ),
    );
  }
  
}