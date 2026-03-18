package src;

import interfaces.NodeInterface;

public class Node<T> implements NodeInterface<T>{
    private T data;
    private Node<T> leftNode;
    private Node<T> rightNode;
    private int nodeId;

    public Node() {}

    public Node(T data) {
        this.data = data;
        nodeId = -1;
    }

    public Node(T data, Node<T> leftNode, Node<T> rightNode) {
        this.data = data;
        this.leftNode = leftNode;
        this.rightNode = rightNode;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getId() {
        return nodeId;
    }

    public void setId(int id) {
        nodeId = id;
    }

    public Node<T> getLeft() {
        return leftNode;
    }

    public void setLeft(NodeInterface<T> leftNode) {
        this.leftNode = (Node<T>) leftNode;
    }

    public Node<T> getRight() {
        return rightNode;
    }

    public void setRight(NodeInterface<T> rightNode) {
        this.rightNode = (Node<T>) rightNode;
    }

    public boolean isLeaf() {
        return leftNode == null && rightNode == null;
    }

    public Node<T> copy() {
        Node<T> newRoot = new Node<>(data);
        if (leftNode != null) {
            newRoot.setLeft(leftNode.copy());
        }
        if (rightNode != null) {
            newRoot.setRight(rightNode.copy());
        }

        return newRoot;
    }
}
