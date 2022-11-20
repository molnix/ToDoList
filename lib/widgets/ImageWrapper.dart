import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  const ImageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Image.asset("assets/images/ball.png", fit: BoxFit.contain,),
    );
  }
}