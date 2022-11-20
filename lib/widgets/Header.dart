import 'package:flutter/material.dart';

import 'HeaderButtons.dart';
import 'ImageWrapper.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 280.0,
        child: Column(
          children: [
            Stack(
              children: [
                ImageWrapper(),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: HeaderButtons(),
                  ), 
                ), 
              ],
            ),
          ],
        ),
      );
  }
}