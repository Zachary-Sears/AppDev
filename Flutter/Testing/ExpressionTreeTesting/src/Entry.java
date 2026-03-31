package src;

public class Entry {
    public static void main(String[] args) {
        ExpressionTree<String> tree = new ExpressionTree<>();
        String expression = "22*2-8/2+10";
        tree.generateTree(expression);

        System.out.println(tree.evaluate());
    }
}