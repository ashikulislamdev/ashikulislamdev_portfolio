import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          image: AssetImage('assets/images/flutter-bg.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}