import 'package:flutter/material.dart';

import 'package:simpletodo/widgets/Header.dart';
import 'package:simpletodo/widgets/Body.dart';

class HomePage extends StatefulWidget{
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Header(),
          Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}