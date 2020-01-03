/*
    Populating Next Right Pointers in Each Node
*/
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node next;

    public Node() {}

    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, Node _left, Node _right, Node _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};

/*
Input: root = [1,2,3,4,5,6,7]
Output: [1,#,2,3,#,4,5,6,7,#]
Explanation: Given the above perfect binary tree (Figure A),
        your function should populate each next pointer to point to its next right node, just like in Figure B.
        The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
*/

/*
 @param {Node} root
 @return {Node}
*/

class Solution {
    /*
    * Using iteration
    * */
    public Node connect(Node root) {
        Node leftNode = root;
        while (leftNode != null && leftNode.left != null) {
            populateNode(leftNode);
            leftNode = leftNode.left;
        }

        return root;
    }

    public void populateNode(Node startNode) {
        Node temp = startNode;

        while (temp != null) {
            temp.left.next = temp.right;
            if (temp.next != null) {
                temp.right.next = temp.next.left;
            }
            temp = temp.next;
        }

    }

    /*
    * Using iteration
    * */
    public Node connect(Node root) {
        if (root == null) return null;
        Node temp = root;
        while (temp.left != null) {
            Node p = temp;
            while (true) {
                p.left.next = p.right;
                if (p.next == null) break;
                p.right.next = p.next.left;
                p = p.next;
            }
            temp = temp.left;
        }
    }
}

/*
    Input: root = [1,2,3,4,5,null,7]
    Output: [1,#,2,3,#,4,5,7,#]
    Explanation: Given the above binary tree (Figure A),
    your function should populate each next pointer to point to its next right node, just like in Figure B.
    The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
*/

/*
 @param {Node} root
 @return {Node}
*/
class Solution {
    /*
    * Using recursion
    * */
    public Node connect(Node root) {
        if(root == null)
            return null;

        if(root.left != null){
            if(root.right != null){
                root.left.next = root.right;
            } else {
                root.left.next = findNext(root.next);
            }
        }
        if (root.right != null) {
            root.right.next = findNext(root.next);
        }

        // Connect the right node first
        connect(root.right);
        connect(root.left);

        return root;
    }

    public Node findNext(Node root) {
        if(root == null)
            return null;
        if(root.left != null)
            return root.left;
        if(root.right != null)
            return root.right;

        return findNext(root.next);
    }
}

/*
 @param {Node} root
 @return {Node}
 Solution random tree
*/
class Solution {
    /*
    * Using recursion
    * */
    public Node connect(Node root) {
        if(root == null)
            return null;

        // Connect all nextRight node before moving to the next level
        if(root.next != null)
            connect(root.next);

        if(root.left != null){
            if(root.right != null){
                root.left.next = root.right;
                root.right.next = findNext(root.next);
            } else {
                root.left.next = findNext(root.next);
            }
        }

        return root;
    }

    public Node findNext(Node root) {
        if(root == null)
            return null;
        if(root.left != null)
            return root.left;
        if(root.right != null)
            return root.right;

        return findNext(root.next);
    }
}