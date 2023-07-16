import 'package:calculator/providers/calculator_provider.dart';
import 'package:calculator/utils/buttons_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsRow extends StatelessWidget {
  final List<String> keys;
  const ButtonsRow({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;

    void onClicked(String keyName) {
      if(keyName == "AC"){
        Provider.of<CalculationProvider>(context,listen: false).clearButtonPressed();
      }
      else if(keyName == "+/-"){
        Provider.of<CalculationProvider>(context,listen: false).signChangePressed();
      }
      else if(keyName == "="){

        Provider.of<CalculationProvider>(context,listen: false).equalButtonPressed();
      }
      else if( keyName == "÷" || keyName == "x" || keyName == "-" || keyName == "+" || keyName == "%"){
        Provider.of<CalculationProvider>(context,listen: false).operatorButtonPressed(keyName);
      }
      else{
        Provider.of<CalculationProvider>(context,listen: false).numButtonPressed(keyName);
      }
    }
    return Row(
        children: keys.map((keyName) {
      return Container(
        width: keyName == "0" ? (size * 2) : size,
        height: size,
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonsColor(keyName),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            textStyle:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onPressed: ()=>onClicked(keyName),
          child: Text(keyName),
        ),
      );
    }).toList());
  }
}
