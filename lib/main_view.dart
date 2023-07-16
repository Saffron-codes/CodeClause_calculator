import 'package:calculator/providers/calculator_provider.dart';
import 'package:calculator/widgets/buttons_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String output = "";


  void onNumButtonPressed(){

  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
		double buttonSize = screen.width / 4;
		double displayHeight = screen.height - (buttonSize * 4) - (buttonSize);
    

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: displayHeight,
            child:  Align(
              alignment: Alignment.bottomRight,
              child: Text(
                Provider.of<CalculationProvider>(context).output,
                style: TextStyle(fontSize: 70,color: Theme.of(context).brightness == Brightness.dark?Colors.white:Colors.black),
              ),
            ),
          ),
          ButtonsGrid()
        ],
      ),
    );
  }
}
