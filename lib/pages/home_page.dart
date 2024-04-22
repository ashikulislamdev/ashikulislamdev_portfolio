import 'package:ashikulislamdev/widgets/right_sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // right side bar
          const Expanded(flex: 3, child: RightSideBar()),
          // main content area
          Expanded(flex: 8, child: Container(color: Theme.of(context).colorScheme.secondary)),
        ],
      ),
    );
  }
}