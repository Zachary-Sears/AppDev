import 'package:stack/stack.dart';

import '../services/node.dart';

class TreeGenerator {
  Node? root;
  String? expression;

  TreeGenerator(this.expression);

  void generateTree() {
    Stack<String> operatorStack = Stack();
    Stack<Node> nodeStack = Stack();

    int i = 0;

    while (i < expression!.length) {
      if (_isDigit(expression![i])) {
        String number = '';
        while (i < expression!.length &&
            (_isDigit(expression![i]) || expression![i] == '.')) {
          number += expression![i++];
        }
        nodeStack.push(Node.fromData(number));
      } else if (expression![i] == '(') {
        String subexpression = '';
        int parenIndicator = 0;
        i ++;
        while (i < expression!.length) {
          // If the parenthesis indicator is zero, meaning all parenthesis pairs are acconted for, and the current character, is a
          //    close paren, break out of the loop and generate a tree on the subexpression
          if (parenIndicator < 1 && expression![i] == ')') {
            break;
          } else {
            // The current character is either a digit, a decimal point, an open parenthesis, or a closing parenthesis
            // Regardless of which character it is, add it to the subexpression
            subexpression += expression![i];
            // If the current character is an open paren, increment the parenIndicator
            // Else if the current character is a closing paren, decrement the parenIndicator.
            if (expression![i] == '(') {
              parenIndicator++;
            } else if (expression![i] == ')' ||
                (expression![i] == ')' && parenIndicator == 1)) {
              parenIndicator--;
            }

            i++;
          }
        }

        i++;
        TreeGenerator subTree = TreeGenerator(subexpression);
        subTree.generateTree();
        nodeStack.push(subTree.root!);
      } else {
        while (operatorStack.isNotEmpty &&
            (_precedence(operatorStack.top()) > _precedence(expression![i]) ||
                _precedence(operatorStack.top()) ==
                    _precedence(expression![i]))) {
          String operator = operatorStack.pop();
          Node right = nodeStack.pop();
          Node left = nodeStack.pop();
          nodeStack.push(Node(operator, left, right));
        }
        operatorStack.push(expression![i++]);
      }
    }

    while (operatorStack.isNotEmpty) {
      String operator = operatorStack.pop();
      Node right = nodeStack.pop();
      Node left = nodeStack.pop();
      nodeStack.push(Node(operator, left, right));
    }

    root = nodeStack.pop();
  }

  int _precedence(String operator) {
    if (operator == '*' || operator == '/') {
      return 2;
    } else if (operator == '+' || operator == '-') {
      return 1;
    } else {
      return -1;
    }
  }

  bool _isDigit(String c) {
    return int.tryParse(c) != null;
  }
}