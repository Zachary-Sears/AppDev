package interfaces;

public interface NodeInterface<T> {
        public T getData();
        public void setData(T data);
        public NodeInterface<T> getLeft();
        public void setLeft(NodeInterface<T> leftNode);
        public NodeInterface<T> getRight();
        public void setRight(NodeInterface<T> rightNode);
        public boolean isLeaf();
        public NodeInterface<T> copy();
}
