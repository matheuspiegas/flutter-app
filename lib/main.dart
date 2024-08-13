import 'package:flutter/material.dart';
import 'package:flutterteste/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.deepPurple,
            background: Colors.grey[100]),
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple))),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
