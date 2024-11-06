import 'package:flutter/material.dart';
import 'package:temuhobi/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Mengatur warna tema aplikasi.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: const Color.fromARGB(255, 185, 214, 198)),
      ),
      home: MyHomePage(),
    );
  }
}
