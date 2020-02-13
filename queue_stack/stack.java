/*

Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).

*/

// Definition for a Node.
class Node {
    public int val;
    public List<Node> neighbors;

    public Node() {
        val = 0;
        neighbors = new ArrayList<Node>();
    }

    public Node(int _val) {
        val = _val;
        neighbors = new ArrayList<Node>();
    }

    public Node(int _val, ArrayList<Node> _neighbors) {
        val = _val;
        neighbors = _neighbors;
    }
}

class Solution {
    HashMap<Node, Node> map = new HashMap<>();

    public Node cloneGraph(Node node) {
        map.put(node, new Node(node.val, new ArrayList<>()));

        for(Node neighbor: node.neighbors){
            if(map.containsKey(neighbor)){
                // if neighbor is already in map, add it to the node's neighbors
                map.get(node).neighbors.add(map.get(neighbor));
            }else{
                map.get(node).neighbors.add(cloneGraph(neighbor));
            }
        }

        return map.get(node);

    }
}
