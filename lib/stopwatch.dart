import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Swatch extends StatefulWidget {
  Swatch({super.key});

  @override
  State<Swatch> createState() {
    return _SwatchState();
  }
}

class _SwatchState extends State<Swatch> {
  late Timer _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  void _startStopwatch() {
    if (_isRunning) {
      _timer.cancel();
    } else {
      _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        setState(() {
          _milliseconds++;
        });
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetStopwatch() {
    if (_isRunning) {
      _timer.cancel();
    }
    setState(() {
      _milliseconds = 0;
      _isRunning = false;
    });
  }

  String _formatTime(int milliseconds) {
    final int seconds = milliseconds ~/ 100;
    final int displayMilliseconds = milliseconds % 100;
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}:${displayMilliseconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('padam/swatch.jpg'), // Ensure this path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Text(
                      "StopWatch",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Tough times never last, but tough people do",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(157, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatTime(_milliseconds),
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _startStopwatch,
                        child: Icon(_isRunning ?  Icons.stop:Icons.play_arrow ,
                        color: Color.fromARGB(255, 1, 203, 132),),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _resetStopwatch,
                        child: Icon(CupertinoIcons.arrow_clockwise,
                        color: Color.fromARGB(255, 1, 203, 132)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Swatch()));
}
