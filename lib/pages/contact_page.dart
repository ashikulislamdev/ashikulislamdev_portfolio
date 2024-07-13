import 'package:ashikulislamdev/data/constant.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: isMobile ? 100 : 150,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: dSize.height * 0.05),
            Text(
              'This Page is Under Maintenance',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: isMobile ? 24 : 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}