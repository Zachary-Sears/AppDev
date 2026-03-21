import 'dart:ffi';

import 'package:stack/stack.dart';

import '../services/node.dart';

/**
 * This file will contain an expression tree to generate results for
 *  calculator contained in the calculator.dart file.
 */
///
class CalculatorTree {
  Node? root;
  String? expression;

  CalculatorTree(this.expression);

  void generateTree() {
    Stack<String> operatorStack = Stack();
    Stack<Node> nodeStack = Stack();

    int i = 0;

    while (i < expression!.length) {
      if (isDigit(expression![i])) {
        String number = '';
        while (i < expression!.length && isDigit(expression![i])) {
          number += expression![i++];
        }
        nodeStack.push(Node.fromData(number));
      } else {
        while (operatorStack.isNotEmpty &&
            (precedence(operatorStack.top()) > precedence(expression![i]) ||
                precedence(operatorStack.top()) ==
                    precedence(expression![i]))) {
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

  int precedence(String operator) {
    if (operator == '*' || operator == '/') {
      return 2;
    } else if (operator == '+' || operator == '-') {
      return 1;
    } else {
      return -1;
    }
  }

  bool isDigit(String c) {
    return int.tryParse(c) != null;
  }

  double evaluate() {
    return getResult(root);
  }

  double getResult(Node? node) {
    double result;

    if (node == null) {
      result = 0;
    } else if (node!.isLeaf()) {
      String value = node!.data;
      result = double.parse(value);
    } else {
      double firstOperand = getResult(node!.leftNode);
      double secondOperand = getResult(node!.rightNode);
      String operator = node!.data;

      result = compute(operator, firstOperand, secondOperand);
    }

    return result;
  }

  double compute(String operator, double firstOperand, double secondOperand) {
    if (operator == '+') {
      return firstOperand + secondOperand;
    } else if (operator == '-') {
      return firstOperand - secondOperand;
    } else if (operator == '*') {
      return firstOperand * secondOperand;
    } else {
      return firstOperand / secondOperand;
    }
  }
}
