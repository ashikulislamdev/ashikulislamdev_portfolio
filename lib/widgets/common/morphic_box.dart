import 'package:ashikulislamdev/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MorphicBox extends StatelessWidget {
  final Widget child;
  const MorphicBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    //is dark mood
    bool isDarkMood = Provider.of<ThemeProvider>(context).isDarkMood;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
          BoxShadow(
            color: isDarkMood ? Colors.black : Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4)
          ),
          //lighter shadow on top left
          BoxShadow(
            color: isDarkMood ? Colors.grey.shade700 : Colors.white,
            blurRadius: 15,
            offset: const Offset(-4, -4),
          )
        ]
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}