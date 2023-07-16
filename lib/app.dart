import 'package:calculator/main_view.dart';
import 'package:calculator/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=>CalculationProvider(),
      child: MaterialApp(
        home: const MainView(),
        theme: ThemeData(
          brightness: Brightness.light
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}