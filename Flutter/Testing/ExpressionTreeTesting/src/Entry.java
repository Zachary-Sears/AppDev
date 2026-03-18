package src;

public class Entry {
    public static void main(String[] args) {
        ExpressionTree<String> tree = new ExpressionTree<>();
        String expression = "3*6/9+2";
        tree.generateTree(expression);

        System.out.println(tree.evaluate());
    }
}