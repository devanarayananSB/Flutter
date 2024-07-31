
import 'package:flutter/material.dart';
import 'package:projectflutt2/stopwatch.dart';

void main() {
  runApp(MyFirstWidget());
}
class MyFirstWidget extends StatelessWidget{
  MyFirstWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
        child:Swatch(),
      ),
      )
    );
  }
}