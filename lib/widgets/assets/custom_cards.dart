import 'package:flutter/material.dart';


class LargeSecondaryCard extends StatelessWidget {
  const LargeSecondaryCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xFFC20430),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      )
    );
  }
}


class LargePrimaryCard extends StatelessWidget {
  const LargePrimaryCard({super.key, required this.child});

  final Widget child;

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xFF3D3D3D),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      )
    );
  }
}







class SmallHighlightCardHollow extends StatelessWidget {
  const SmallHighlightCardHollow({super.key, required this.child});

  final Widget child;

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(
          color: Color(0xFFFFC72A),
        ),
      ),
      color: const Color(0x00FFFFFF),

      child: DefaultTextStyle.merge(
        style: const TextStyle(
          color: Color(0xFFFFC72A),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: child,
        )
      ),
    );
  }
}