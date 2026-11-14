import 'calc_tree_generator.dart';
import 'node.dart';

class TreeEvaluator {

  static double evaluate(TreeGenerator tree) {
    return _getResult(tree.root);
  }

  static double _getResult(Node? node) {
    double result;

    if (node == null) {
      result = 0;
    } else if (node.isLeaf()) {
      String value = node.data;
      result = double.parse(value);
    } else {
      double firstOperand = _getResult(node.leftNode);
      double secondOperand = _getResult(node.rightNode);
      String operator = node.data;

      result = _compute(operator, firstOperand, secondOperand);
    }

    return result;
  }

  static double _compute(String operator, double firstOperand, double secondOperand) {
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