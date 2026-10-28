import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  String displayText = '';
  num result = 0;

  int parenIndicator = 0;

  void updateDisplayText(String newCharacter) {
    if (newCharacter == '=') {
      if (displayText.isEmpty) {
        displayText = '0=0';
      } else if (displayText == "0=0") {
        // if user repeatedly enters an empty string, do nothing.
      } /*else if () {
        TODO: Repeat operation with result in place of first operand
        // i.e. 4*3=12 -> 12*3=36
      } */else {
        // TODO
        // Instantiate calculator tree on displayText
        // Generate and evaluate the tree.
      }
    } else if (newCharacter == '(') {
      if (parenIndicator > 0) {
        if (displayText.isEmpty) {
          displayText += '(';
          parenIndicator++;
        } else if (displayText[displayText.length - 1] == '(' ||
            isOperator(displayText[displayText.length - 1])) {
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

  void clearDisplayText() {
    displayText = '';
    parenIndicator = 0;
    notifyListeners();
  }

  void clearResult() {
    result = 0;
  }

  void backspace() {
    if (displayText.length - 1 <= 0) {
      displayText = '';
      parenIndicator = 0;
    } else {
      if (displayText[displayText.length - 1] == '(') {
        parenIndicator --;
      }

      displayText = displayText.substring(0, displayText.length - 1);
    }

    notifyListeners();
  }

  bool isOperator (String character) {
    return character == '+' ||
      character == '-' ||
      character == '*' ||
      character == '/';
  }
}