import 'package:calculator/services/calc_tree_generator.dart';
import 'package:calculator/services/tree_evaluator.dart';
import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  var displayText = '';
  num result = 0;

  int parenIndicator = 0;

  void updateDisplayText(String newCharacter) {
    
    if (newCharacter == '=') {
      if (displayText.isEmpty) {
        displayText = "0=0";
      } else if (displayText == "0=0") {
        // if user repeatedly enters an empty string, do nothing.
      } else if (displayText.contains('=')) {
        // i.e. 4*3=12 -> 12*3=36
        _repeatOperation();
      } else {
        _treeHandler();
      }
    } else if (newCharacter == '(') {
      _parenHandler();
    } else if (newCharacter == 'C') {
      _clearDisplayText();
    } else if (newCharacter == 'b') {
      _backspace();
    } else {
      displayText += newCharacter;
    }

    if (displayText.length > 20) {
      // Find some way to notify the user that only
      //  20 characters are allowed in the display.

      displayText = displayText.substring(0, 20);
    }

    notifyListeners();
  }

  void _repeatOperation() {
    // Extract subexpressions for result and for first operand.
    // Find index of '='.
    int equalIndex = displayText.indexOf('=');
    // Extract result
    String r = displayText.substring(equalIndex + 1);
    // Find the index of the first operator.
    int index = 0;
    while (!_isOperator(displayText[index])) {
      index ++;
    }
    // Extract everything except the first operator and the equal sign.
    String secondHalfNewExp = displayText.substring(index, equalIndex);
    displayText = r + secondHalfNewExp;
    _treeHandler();
  }

  void _treeHandler() {
    // Instantiate calculator tree on displayText
    // Generate and evaluate the tree.
    TreeGenerator tree = TreeGenerator(displayText);
    tree.generateTree();
    result = TreeEvaluator.evaluate(tree);
    if (result % 1 == 0) {
      result = result.truncate();
    }

    displayText += '=';
    displayText += result.toString();
  }

  void _parenHandler() {
      /*
       * Add open paren when:
       *  the display text is empty
       *  the previous character is an operator
       */
      if (parenIndicator > 0) {
        if (displayText.isEmpty) {
          displayText += '(';
          parenIndicator++;
        } else if (displayText[displayText.length - 1] == '(' ||
            _isOperator(displayText[displayText.length - 1])) {
          displayText += '(';
          parenIndicator ++;
        } else {
          displayText += ')';
          parenIndicator --;
        }
      } else {
        displayText += '(';
        parenIndicator ++;
      }
  }

  void _clearDisplayText() {
    displayText = '';
    parenIndicator = 0;
    result = 0;
  }

  void _backspace() {
    if (displayText.length - 1 <= 0) {
      displayText = '';
      parenIndicator = 0;
    } else {
      if (displayText[displayText.length - 1] == '(') {
        parenIndicator --;
      }

      displayText = displayText.substring(0, displayText.length - 1);
    }
  }

  bool _isOperator (String character) {
    return character == '+' ||
      character == '-' ||
      character == '*' ||
      character == '/';
  }
}