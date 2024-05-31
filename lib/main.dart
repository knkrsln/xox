import 'package:flutter/material.dart';
import 'package:xox/robotPlayer.dart';
import 'package:xox/twoPlayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: Icon(Icons.gamepad_outlined),
        title: Text("XOX oyunu girişi"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TwoPlayer(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/twoPlayer.jpg',
                      height: 200,
                      width: 200,
                    ),
                    const Text("2 Kişilik"),
                  ],
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RobotPlayer(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(195, 165, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/robot.jpg',
                      height: 200,
                      width: 200,
                    ),
                    const Text("Robota Karşı"),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Kaan Karaaslan")
        ],
      ),
    );
  }
}
