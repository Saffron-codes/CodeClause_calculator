import 'package:calculator/utils/buttons_color.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final List<List<String>> buttons = [
    [
      'AC',
      '+/-',
      '%',
      '÷',
    ],
    [
      '7',
      '8',
      '9',
      'x',
    ],
    [
      '4',
      '5',
      '6',
      '-',
    ],
    [
      '1',
      '2',
      '3',
      '+',
    ],
    [
      '0',
      '.',
      '=',
    ]
  ];

  var calculation = "";

  double num1 = 0;
  double num2 = 0;

  bool isClickedOpr = false;
  bool isNegativeSign = false;

  var curNumber = "";
  var curOpr = "";

  void buttonClicked(String btnName) {
    setState(() {
      if (isClickedOpr) {
        curNumber += btnName;
        num2 = double.parse(curNumber);
        calculation += curNumber;
      } else {
        calculation += btnName;
        curNumber = calculation;
      }
    });
  }

  void signChangeClicked() {
    if (!isNegativeSign) {
      calculation = (-(double.parse(calculation))).toString();
      curNumber = (-(double.parse(curNumber))).toString();
      setState(() {
        isNegativeSign = false;
      });
    } else {
      calculation = ((double.parse(calculation))).toString();
      curNumber = (-(double.parse(curNumber))).toString();
      setState(() {
        isNegativeSign = true;
      });
    }
  }

  void clearBtnClicked() {
    setState(() {
      calculation = "";
      curNumber = "";
      isClickedOpr = false;
      isNegativeSign = false;
    });
  }

  void operatorClicked(String operator) {
    num1 = double.parse(calculation);
    isClickedOpr = true;
    curOpr = operator;
    setState(() {
      calculation += operator;
      curNumber = "";
    });
  }

  void equalBtnClicked() {
    setState(() {
      if (curOpr == "+") {
        curNumber = (num1 + num2).toString();
      } else if (curOpr == "-") {
        curNumber = (num1 - num2).toString();
      } else if (curOpr == "÷") {
        curNumber = (num1 / num2).toString();
      } else if (curOpr == "x") {
        curNumber = (num1 * num2).toString();
      } else if (curOpr == "%") {
        curNumber = (num1 % num2).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(20),
              
              child: calculationView(context),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buttons.map((btnGroup) => buttonRow(btnGroup)).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget calculationView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 26),
          child: Text(
            calculation.isNotEmpty ? calculation : "0",
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            curNumber.isNotEmpty ? curNumber : "0",
            style: const TextStyle(fontSize: 50),
          ),
        )
      ],
    );
  }

  Widget buttonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((btnName) => calcBtn(btnName)).toList(),
    );
  }

  Widget calcBtn(String btnName) {
    return ElevatedButton(
      onPressed: () {
        if (btnName == '=') {
          equalBtnClicked();
        } else if (btnName == 'AC') {
          clearBtnClicked();
        } else if (btnName == '+' ||
            btnName == '-' ||
            btnName == 'x' ||
            btnName == '÷' ||
            btnName == '%') {
          operatorClicked(btnName);
        } else if (btnName == "+/-") {
          signChangeClicked();
        } else {
          buttonClicked(btnName);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonsColor(btnName),
        fixedSize: btnName == "0"
            ? Size((MediaQuery.sizeOf(context).width / 4.5) * 2, 70)
            : null,
        shape: btnName == "0" ? const StadiumBorder() : null,
      ),
      child: Text(
        btnName,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
