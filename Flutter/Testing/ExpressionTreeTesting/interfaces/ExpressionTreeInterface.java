package interfaces;
/**
 * This interface defines the operations the expression tree will need perform.
 * 
 * This interface is application specific, so it is more complete than a more generally applicable tree interface would be.
 *  i.e. includes insertion and removal of nodes.
 */ 
public interface ExpressionTreeInterface<T> {
    public void generateTree(T newData);
    public void remove(T target);
    public boolean isEmpty();
    public int getSize();
    public void clear();
    public void setRootData(T rootData);
    public void setTree(T rootData, ExpressionTreeInterface<T> leftTree, ExpressionTreeInterface<T> rightTree);
}