import 'package:flutter/material.dart';

import 'buttons_row.dart';

class ButtonsGrid extends StatefulWidget {
  const ButtonsGrid({super.key});

  @override
  State<ButtonsGrid> createState() => _ButtonsGridState();
}

class _ButtonsGridState extends State<ButtonsGrid> {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons
          .map(
            (buttonGroup) => ButtonsRow(keys: buttonGroup),
          )
          .toList(),
    );
  }
}
