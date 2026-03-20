package src;

public class Entry {
    public static void main(String[] args) {
        ExpressionTree<String> tree = new ExpressionTree<>();
        String expression = "6*2-2+10*2";
        tree.generateTree(expression);

        System.out.println(tree.evaluate());
    }
}