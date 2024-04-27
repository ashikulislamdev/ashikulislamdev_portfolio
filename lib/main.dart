import 'package:ashikulislamdev/providers/menu_provider.dart';
import 'package:ashikulislamdev/theme/dark_mode.dart';
import 'package:ashikulislamdev/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SelectedIndexProvider()),
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ashikul Islam Sawan',
      theme: darkMood,
      home: const HomePage(),
    );
  }
}
