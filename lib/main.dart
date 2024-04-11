import 'package:bioskop_keren/presentation/page/home/home_page.dart';
import 'package:bioskop_keren/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bioskop Keren',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const HomePage(),
    );
  }
}
