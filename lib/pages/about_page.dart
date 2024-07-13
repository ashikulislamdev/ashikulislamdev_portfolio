import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/widgets/common/bg_container.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return BackgroundContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // About me section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: dSize.height * 0.02),
                      Text(
                        'I\'m a passionate Flutter developer, and I\'m very dedicated to my work. With a strong background in computer science and a keen interest in volunteering, I strive to build applications that make a difference.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: dSize.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Projects and clients section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Projects Completed',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: dSize.height * 0.01),
                      Text(
                        '15+ projects completed successfully.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: dSize.height * 0.02),
                      Text(
                        'Clients Worked With',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: dSize.height * 0.01),
                      Text(
                        '10+ satisfied clients worldwide.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Contact and CV section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add contact me functionality
                        },
                        icon: const Icon(Icons.contact_mail),
                        label: const Text('Contact Me'),
                      ),
                      SizedBox(height: dSize.height * 0.02),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add download CV functionality
                        },
                        icon: const Icon(Icons.download),
                        label: const Text('Download CV'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}