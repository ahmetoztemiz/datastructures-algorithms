import UIKit

/*
 ___      _    _
/ __|_  _| |__| |_ _ _ ___ ___
\__ \ || | '_ \  _| '_/ -_) -_)
|___/\_,_|_.__/\__|_| \___\___|

 // Challenge: T1 is a large binary tree and T2 is a smaller one. Write an
 // algorithm to determine if T2 is a subtree of T1.

 Root
                5
              3   7
             2 4 6 8
 
 Subtree
                7
               6 8
 
 */

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func isSubTree(_ tree: Node, _ subTree: Node) -> Bool {
    var orderedKeys = ""
    var subOrderedKeys = ""
    orderTreeKeys(tree, &orderedKeys)
    orderTreeKeys(subTree, &subOrderedKeys)

    return orderedKeys.contains(subOrderedKeys)
}

func orderTreeKeys(_ node: Node?, _ keys: inout String) {
    guard let node else {
        return
    }
    keys.append(String(node.key))
    orderTreeKeys(node.left, &keys)
    orderTreeKeys(node.right, &keys)
}

let root = Node(5)
root.left = Node(3)
root.right = Node(7)
root.left?.left = Node(2)
root.left?.right = Node(4)
root.right?.left = Node(6)
root.right?.right = Node(8)

let subTree = Node(7)
subTree.left = Node(6)
subTree.right = Node(8)

isSubTree(root, subTree)
