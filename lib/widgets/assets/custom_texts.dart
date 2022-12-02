import 'package:flutter/material.dart';


const headerTextSizeMax = 30.0;

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.text, required this.size});

  final String text;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: (headerTextSizeMax-size*5)
      )
    );
  }
}



// CustomSubHeading

class CustomSubHeading extends StatelessWidget {
  const CustomSubHeading({super.key, required this.text, required this.size});

  final String text;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: (headerTextSizeMax-size*5),
        color: const Color(0xFFADADAD)
      )
    );
  }
}


class HighlightText extends StatelessWidget {
  const HighlightText({super.key, required this.text, required this.size});

  final String text;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: (headerTextSizeMax-size*5),
        color: const Color(0xFFFFC72A)
      )
    );
  }
}