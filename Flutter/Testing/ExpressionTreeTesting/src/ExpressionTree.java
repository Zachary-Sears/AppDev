package src;

import interfaces.*;

import java.util.NoSuchElementException;
import java.util.Stack;
/**
 * This expression tree is a test and refamiliariarization for myself in a familiar environment
 *      with the structure in preparation for implementation in Dart for my calculator app.
 * 
 * This class will define an expression tree traversed in post order and evaluated using a postfix
 *      operation structure as a consequence.
 * 
 * Nodes in this tree will hold either a double numerical value or a character operator, i.e '*', '+'.
 */
public class ExpressionTree<T> implements ExpressionTreeInterface<String> {

    private Node<String> root;
    private int size;

    public ExpressionTree() {
        root = new Node<>();
        size = 0;
    }

    public ExpressionTree(String data) {
        root = new Node<>(data);
        size = 1;
    }

    public void generateTree(String data) {
        ExpressionTree<String> tree = generateSubTree(data);
        root = tree.root;
        size += tree.getSize();
    }

    private ExpressionTree<String> generateSubTree(String data) {
        ExpressionTree<String> retTree = new ExpressionTree<>();
        Stack<Character> operatorStack = new Stack<>();
        Stack<Node<String>> nodeStack = new Stack<>();

        int dataIndex = 0;

        while (dataIndex < data.length()) {
            if (Character.isDigit(data.charAt(dataIndex))) {
                String number = "";
                while (dataIndex < data.length() && Character.isDigit(data.charAt(dataIndex)))
                    number += data.charAt(dataIndex ++);
                nodeStack.push(new Node<>(number));
            } else {
                while (!operatorStack.isEmpty() && 
                        (precedence(operatorStack.peek()) > precedence(data.charAt(dataIndex)) ||
                         precedence(operatorStack.peek()) == precedence(data.charAt(dataIndex)))) {
                    char operator = operatorStack.pop();
                    Node<String> right = nodeStack.pop();
                    Node<String> left = nodeStack.pop();
                    nodeStack.push(new Node<>(String.valueOf(operator), left, right));
                }
                operatorStack.push(data.charAt(dataIndex));
                dataIndex ++;
            }
        }

        while (!operatorStack.isEmpty()) {
            char operator = operatorStack.pop();
            Node<String> right = nodeStack.pop();
            Node<String> left = nodeStack.pop();
            nodeStack.push(new Node<>(String.valueOf(operator), left, right));
        }

        retTree.setRootNode(nodeStack.pop());
        
        return retTree;
    }

    private static int precedence(char operator) {
        if (operator == '*' || operator == '/')
            return 2;
        else if (operator == '+' || operator == '-')
            return 1;
        else
            return -1;
    }

    private void setRootNode(Node<String> rootNode) {
        root = new Node<>(rootNode.getData());
        root.setLeft(rootNode.getLeft());
        root.setRight(rootNode.getRight());
    }

    public void remove(String target) {
        IteratorInterface<String> iter = new InOrderIterator();
        while (iter.hasNext()) {
            if (iter.getCurrentNode().getData().equals(target)) {
                iter.remove();
            } else {
                iter.next();
            }
        }
        size --;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public int getSize() {
        return size;
    }

    public void clear() {
        root = null;
        size = 0;
    }

    public void setRootData(String rootData) {
        root.setData(rootData);
        size ++;
    }

    public String getRootData() {
        if (isEmpty()) {
            throw new NullPointerException();
        } else {
            return root.getData();
        }
    }

    public void setTree(String rootData, ExpressionTreeInterface<String> leftTree, ExpressionTreeInterface<String> rightTree) {
        initializeTree(rootData, (ExpressionTree<T>) leftTree, (ExpressionTree<T>) rightTree);
    } 

    private void initializeTree(String rootData, ExpressionTree<T> leftTree, ExpressionTree<T> rightTree) {
        root = new Node<>(rootData);
        size ++;

        if ((leftTree != null) && (!leftTree.isEmpty())) {
            root.setLeft(leftTree.root);
            size += leftTree.getSize();
        }

        if ((rightTree != null) && !rightTree.isEmpty()) {
            if (rightTree != leftTree) {
                root.setRight(rightTree.root);
                size += rightTree.getSize();
            } else {
                root.setRight(rightTree.root.copy());
                size += rightTree.getSize();
            }
        }

        if (leftTree != null && leftTree != this) {
            leftTree.clear();
        }

        if (rightTree != null && rightTree != this) {
            rightTree.clear();
        }
    }

    public double evaluate() {
        return evaluate(root);
    }

    private double evaluate(Node<String> rootNode) {
        double result;

        if (rootNode == null) {
            result = 0;
        } else if (rootNode.isLeaf()) {
            String var = rootNode.getData();
            result = getValueOf(var);
        } else {
            double firstOperand = evaluate(rootNode.getLeft());
            double secondOperand = evaluate(rootNode.getRight());
            String operator = rootNode.getData();

            result = compute(operator, firstOperand, secondOperand);
        }

        return result;
    }

    private double getValueOf(String var) {
        return Double.valueOf(var);
    }

    private double compute(String operator, double firstOperand, double secondOperand) {
        if (operator.equals("+"))
            return firstOperand + secondOperand;
        else if (operator.equals("-"))
            return firstOperand - secondOperand;
        else if (operator.equals("*"))
            return firstOperand * secondOperand;
        else
            return firstOperand / secondOperand;
    }

    class InOrderIterator implements IteratorInterface<String> {
        private Stack<Node<String>> nodeStack;
        private Node<String> currentNode;

        public InOrderIterator() {
            nodeStack = new Stack<>();
            currentNode = root;
        }

        public NodeInterface<String> getCurrentNode() {
            return currentNode;
        }

        public boolean hasNext() {
            return !nodeStack.isEmpty() || (currentNode != null);
        }

        public String next() {
            Node<String> nextNode = null;

            while(currentNode != null) {
                nodeStack.push(currentNode);
                currentNode = currentNode.getLeft();
            }

            if (!nodeStack.isEmpty()) {
                nextNode = nodeStack.pop();
                currentNode = nextNode.getRight();
            } else {
                throw new NoSuchElementException();
            }

            return nextNode.getData();
        }

        public void remove() {
            IteratorInterface<String> iter = new InOrderIterator();
            while (iter.hasNext()) {
                if (iter.getCurrentNode().getLeft() == currentNode) {
                    iter.getCurrentNode().setLeft(null);
                } else if (iter.getCurrentNode().getRight() == currentNode) {
                    iter.getCurrentNode().setRight(null);
                } else {
                    iter.next();
                }
            }
        }
    }
}