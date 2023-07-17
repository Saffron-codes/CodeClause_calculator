import 'package:calculator/calculator_view.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  const CalculatorView(),
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize:  Size(MediaQuery.sizeOf(context).width/4.5, 80),
            shape: const CircleBorder(),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}
