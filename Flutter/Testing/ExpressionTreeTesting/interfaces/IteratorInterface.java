package interfaces;

public interface IteratorInterface<T> {
    public NodeInterface<T> getCurrentNode();
    public boolean hasNext();
    public T next();
    public void remove();
}
