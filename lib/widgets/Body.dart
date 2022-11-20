import 'package:flutter/material.dart';

import 'NotesList.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(

        children:[ 
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                color: Colors.white,
                child: NotesList(),
              ),
            ),
        ]
      ),
    );
  }
}