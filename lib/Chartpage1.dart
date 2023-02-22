import 'package:flutter/material.dart';
import 'package:charts1/Chartpage2.dart';
import 'package:charts1/RoundChart3.dart';

class Chartpage1 extends StatefulWidget {
  const Chartpage1({Key? key}) : super(key: key);

  @override
  State<Chartpage1> createState() => _Chartpage1State();
}

class _Chartpage1State extends State<Chartpage1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr_Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RoundChart3(),
    );
  }
}
