import 'package:flutter/material.dart';

import 'HeaderAddTaskButton.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderAddTaskButton(),
        ],
      ),
    );
  }
}