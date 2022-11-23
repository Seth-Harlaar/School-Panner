import 'package:flutter/material.dart';


class LargePrimaryCard extends StatelessWidget {
  const LargePrimaryCard({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xFFC20430),

      child: Theme(
        data: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white)
          )

        ),
        child: childWidget
      ),
    );
  }
}