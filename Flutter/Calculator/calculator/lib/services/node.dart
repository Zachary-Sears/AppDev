class Node {
  var data;
  Node? leftNode;
  Node? rightNode;

  Node(this.data, this.leftNode, this.rightNode);

  Node.fromData(this.data);

  set left(Node left) => leftNode = left;
  set right(Node right) => rightNode = right;

  bool isLeaf() {
    return leftNode == null && rightNode == null;
  }
}
