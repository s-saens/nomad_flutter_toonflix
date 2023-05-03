import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _Home();
  }
}

class _Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  static const int initialTime = 10;
  int pom = 0;
  int time = 5;
  bool isRunning = false;
  late Timer timer;

  void reset({bool addPom = true}) {
    if (addPom) pom++;
    time = initialTime;
    pause();
  }

  void onTick(Timer t) {
    setState(() {
      time--;
      if (time <= 0) reset();
    });
  }

  void start() {
    if (isRunning) return;

    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  void pause() {
    if (!isRunning) return;

    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  String secToTime(int time) {
    int min = time ~/ 60;
    int sec = time % 60;
    String minStr = min.toString().padLeft(2, '0');
    String secStr = sec.toString().padLeft(2, '0');
    return '$minStr:$secStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 96, 88),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    secToTime(time),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline_rounded
                        : Icons.play_circle_outline_rounded),
                    onPressed: isRunning ? pause : start,
                    iconSize: 128,
                  ),
                  const SizedBox(height: 30),
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.stop_circle_outlined),
                    onPressed: () => reset(addPom: false),
                    iconSize: 48,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  color: Color(0xFFEFD5D5)),
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'POMODOROS',
                    style: TextStyle(
                      color: Color.fromARGB(255, 98, 89, 136),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '$pom',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 32, 20, 77),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
