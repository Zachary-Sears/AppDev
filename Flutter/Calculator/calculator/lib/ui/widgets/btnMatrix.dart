import 'package:calculator/ui/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ButtonLabels {C, (Icons.backspace)}

class Btnmatrix extends StatelessWidget {
  const Btnmatrix({super.key});

  @override
  Widget build(BuildContext context) {
    // var btnMatrixAppState = context.watch<CalculatorState>();
    return GridView.count(crossAxisCount: 4,
    children: List.generate(20, ((index) {
      return Center(
        child: button(character: 'C'),
      );
    }),)
  );}
}

class button extends StatelessWidget {
  const button({super.key,
    required this.character});

    final String character;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      //TODO
    },
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.pressed)) {
          return Theme.of(
            context,
          ).colorScheme.secondary.withValues(alpha: 1);
        }
        return null;
      }),
    ),
    child: Text(character, style: TextTheme.of(context).displayMedium));
  }
}
