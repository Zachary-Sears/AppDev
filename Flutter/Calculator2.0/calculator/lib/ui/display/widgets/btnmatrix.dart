import 'package:calculator/ui/display/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Set<String> btnLabels = {
    "C",
    "", // Left empty for indexing when generating the matrix
    "()",
    "/",
    "1",
    "2",
    "3",
    "*",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "+",
    "+/-",
    "0",
    ".",
    "="
  };

class BtnMatrix extends StatelessWidget {
  const BtnMatrix({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.count(
      crossAxisCount: 4,
      children: List.generate(20, ((index) {
        return Center(
          child: index == 1
              ? Button(childWidget: Icon(Icons.backspace, size: 50), index: index,)
              : index == 2
              ? Button(
                  childWidget: Text(
                    btnLabels.elementAt(index),
                    style: TextTheme.of(context).displayMedium,
                  ),
                 index: index)
              : index == 16
              ? Button(
                  childWidget: Text(
                    btnLabels.elementAt(index),
                    style: TextTheme.of(context).displaySmall,
                  ),
                 index: index)
              : Button(
                  childWidget: Text(
                    btnLabels.elementAt(index),
                    style: TextTheme.of(context).displayLarge,
                  ),
                 index: index),
        );
      })),
    ));
  }
}

class Button extends StatelessWidget {
  const Button ({super.key, required this.childWidget, required this.index});

  final Widget childWidget;
  final int index;

  @override
  Widget build(BuildContext context) {
    var btnMatrixAppState = context.watch<CalculatorModel>();

    return ElevatedButton(onPressed:() {
      //print("presssed");
      // btnMatrixAppState.updateDisplayText(btnLabels.elementAt(index));
      String character = index == 1
        ? 'b' // Backspace
        : index == 2
        ? '(' // Parenthesis
        : index == 16
        ? 'n' // Negate value
        : btnLabels.elementAt(index); // All other characters

        btnMatrixAppState.updateDisplayText(character);
    },
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.pressed)) {
          return Theme.of(context).colorScheme.onSurface.withValues(alpha: 1);
        }
        return Theme.of(context).colorScheme.surface;
      }),
    ),
    child: childWidget,);
  }
}