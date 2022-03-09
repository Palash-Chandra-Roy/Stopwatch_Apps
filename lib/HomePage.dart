import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;
  late Timer timer;

  void handleStop() {
      stopwatch.stop();
  }
  void handleStart(){
      stopwatch.start();
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, '0');
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, '0');
    String minute = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, '0');

    return '$minute:$seconds:$milliseconds';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch = Stopwatch();
    timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stopwatch',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.lightBlue, width: 4),
                  ),
                  child: Text(
                    returnFormattedText(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleStart();
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 28,
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    ElevatedButton(
                      onPressed: () {
                        handleStop();
                      },
                      child: Text(
                        'Stop',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    backgroundColor: Colors.pink),
                  ),

                  onPressed: () {
                    stopwatch.reset();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
