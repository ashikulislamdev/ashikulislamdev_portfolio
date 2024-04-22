import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // right side bar
            Expanded(flex: 3, child: Container(color: Theme.of(context).colorScheme.primary)),
            // main content area
            Expanded(flex: 8, child: Container(color: Theme.of(context).colorScheme.secondary)),
          ],
        ),
      ),
    );
  }
}