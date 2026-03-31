import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/calculator_tree.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class CalculatorState extends ChangeNotifier {
  var currentDisplayText = ''; //Currently displayed text
  double result = 0; //Calculation result

  void updateDisplayText(String newCharacter) {
    if (newCharacter == '=') {
      CalculatorTree tree = CalculatorTree(currentDisplayText);
      tree.generateTree();
      result = tree.evaluate();
      currentDisplayText += newCharacter;
      currentDisplayText += result.toString();
    } else {
      currentDisplayText += newCharacter;
    }
    notifyListeners();
  }

  void clearDisplayText() {
    currentDisplayText = '';
    notifyListeners();
  }

  void clearResult() {
    result = 0;
  }

  void backspace() {
    if (currentDisplayText.length - 1 <= 0) {
      currentDisplayText = '';
    } else {
      currentDisplayText = currentDisplayText.substring(
        0,
        currentDisplayText.length - 1,
      );
    }
    notifyListeners();
  }
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorState(),
      child: MaterialApp(
        home: Scaffold(
          body: Expanded(
            child: Column(
              children: [
                Display(),
                Divider(
                  color: Colors.deepPurple,
                  indent: 15,
                  endIndent: 15,
                  thickness: 2.5,
                  radius: BorderRadius.all(Radius.circular(5)),
                ),
                ButtonMatrix(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    var displayAppState = context.watch<CalculatorState>();
    var currentDisplayText = displayAppState.currentDisplayText;

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(15, 150, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            currentDisplayText,
            style: TextStyle(fontSize: 75, fontFamily: 'NanumGothicCoding'),
          ),
        ],
      ),
    );
  }
}

class ButtonMatrix extends StatelessWidget {
  const ButtonMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    var buttonMatrixAppState = context.watch<CalculatorState>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.clearDisplayText();
                  buttonMatrixAppState.clearResult();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.backspace();
                  //Reverse previous opration
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Icon(Icons.backspace, size: 50),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Icon(Icons.history_rounded, size: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('/');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '/',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('1');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('2');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('3');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('*');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '*',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('4');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '4',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('5');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '5',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('6');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '6',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('-');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('7');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '7',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('8');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '8',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('9');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '9',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('+');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '+/-',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('0');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('.');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '.',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  buttonMatrixAppState.updateDisplayText('=');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '=',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
