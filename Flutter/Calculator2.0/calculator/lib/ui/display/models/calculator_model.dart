import 'package:calculator/services/calc_tree_generator.dart';
import 'package:calculator/services/tree_evaluator.dart';
import 'package:material_ui/material_ui.dart';

class CalculatorModel extends ChangeNotifier {
  String displayText = '';
  String expression = '';
  
  num result = 0;
  int validExpression = 0;

  int parenIndicator = 0;

  void updateDisplayText(String newCharacter) {
    validExpression = 0;
    if (newCharacter == '=') {
      validExpression = _validateExpression();
      if (validExpression == 0) {
        if (expression.isEmpty) {
          expression = "0=0";
        } else if (expression == "0=0") {
          // if user repeatedly enters an empty string, do nothing.
        } else if (expression.contains('=')) {
          // i.e. 4*3=12 -> 12*3=36
          _repeatOperation();
        } else {
          _treeHandler();
        }
      }
    } else if ((_isOperator(newCharacter) || newCharacter == '(') &&
        expression.contains('=')) {
      _continueOperation(newCharacter);
    } else if (newCharacter == '(') {
      _parenHandler();
    } else if (newCharacter == 'C') {
      _clearexpression();
    } else if (newCharacter == 'b') {
      _backspace();
    } else if (newCharacter == 'n') {
      _negationHandler();
    } else {
      expression += newCharacter;
    }

    if (expression.length > 20) {
      // Find some way to notify the user that only
      //  20 characters are allowed in the display.

      expression = expression.substring(0, 20);
    }

    displayText = expression;

    notifyListeners();
  }

  int _validateExpression() {
    // Check if the first or last character in the expression is an operator.
    if (_isOperator(expression[0]) ||
        _isOperator(expression[expression.length - 1])) {
      return 1;
    }

    // Check if two operators are next to each other i.e. '*+'.
    int i = 1;
    while (i < expression.length - 1) {
      if (_isOperator(expression[i]) && _isOperator(expression[i + 1])) {
        return 2;
      }
      i++;
    }

    // Expression is valid
    return 0;
  }

  void _negationHandler() {
    // Take the most recent operand and subtract it from 0.
    int index = expression.length;
    while (index > 0 || !_isOperator(expression[index])) {
      index --;
    }

    String negate = '(0-';
    String exp = expression.substring(0, index);
    String operand = expression.substring(index + 1);
    expression = '$exp$negate$operand)';
  }

  void _continueOperation(String newCharacter) {
    String r = _extractResult();

    if (newCharacter == '(') {
      expression = '$r*$newCharacter';
      parenIndicator ++;
    } else {
      expression = '$r$newCharacter';
    }
  }

  void _repeatOperation() {
    int equalIndex = _equalIndex();
    // Extract result from expression
    String r = _extractResult();
    // Find the index of the first operator.
    int index = 0;
    String leadingParens = '';
    while (!_isOperator(expression[index])) {
      if (expression[index] == '(') {
        leadingParens += '(';
      }

      index++;
    }
    // Extract everything except the first operator and the equal sign.
    String secondHalfNewExp = expression.substring(index, equalIndex);
    expression ='$leadingParens$r$secondHalfNewExp';
    _treeHandler();
  }

  void _treeHandler() {
    // Instantiate calculator tree on expression
    // Generate and evaluate the tree.
    TreeGenerator tree = TreeGenerator(expression);
    tree.generateTree();
    result = TreeEvaluator.evaluate(tree);
    if (result % 1 == 0) {
      result = result.truncate();
    }

    expression += '=$result';
  }

  void _parenHandler() {
    /*
       * Add open paren when:
       *  the display text is empty
       *  the previous character is an operator
       */
    if (parenIndicator > 0) {
      if (expression.isEmpty) {
        expression += '(';
        parenIndicator++;
      } else if (expression[expression.length - 1] == '(' ||
          _isOperator(expression[expression.length - 1])) {
        expression += '(';
        parenIndicator++;
      } else {
        expression += ')';
        parenIndicator--;
      }
    } else {
      expression += '(';
      parenIndicator++;
    }
  }

  void _clearexpression() {
    expression = '';
    parenIndicator = 0;
    result = 0;
  }

  void _backspace() {
    if (expression.length - 1 <= 0) {
      expression = '';
      parenIndicator = 0;
    } else {
      if (expression[expression.length - 1] == '(') {
        parenIndicator--;
      }

      expression = expression.substring(0, expression.length - 1);
    }
  }

  bool _isOperator(String character) {
    return character == '+' ||
        character == '-' ||
        character == '*' ||
        character == '/';
  }

  String _extractResult() {
    return expression.substring(_equalIndex() + 1);
  }

  int _equalIndex() {
    return expression.indexOf('=');
  }
}
