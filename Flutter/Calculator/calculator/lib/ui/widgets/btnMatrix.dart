import 'package:calculator/ui/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Btnmatrix extends StatelessWidget {
  Btnmatrix({super.key});

  var btnLabels = {"C", "", "()", "/", "1", "2", "3", "*", "4", "5", "6", "-", "7", "8", "9", "+", "+/-", "0", ".", "="};

  @override
  Widget build(BuildContext context) {
    // var btnMatrixAppState = context.watch<CalculatorState>();
    return GridView.count(crossAxisCount: 4,
    children: List.generate(20, ((index) {
      return Center(
        child: index == 1? button(child: Text(btnLabels.elementAt(index))) : button(child: Icon(Icons.backspace, size: 50,)),
      );
    }),)
  );}
}

class button extends StatelessWidget {
  const button({super.key,
    required this.child});

    final Widget child;

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
          ).colorScheme.onSurface.withValues(alpha: 1);
        }
        return Theme.of(context).colorScheme.surface;
      }),
    ),
    child: child,
    );
  }
}
