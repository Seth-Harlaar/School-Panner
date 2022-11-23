import 'package:flutter/material.dart';


class HeaderOne extends StatelessWidget {
  const HeaderOne({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30
      )
    );
  }
}