import Foundation
import XCTest

/*
 CheckBST
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 
 Given the root node of a binary tree, determine if it is a binary search tree.
 
 The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func checkBST(root: Node?) -> Bool {
    guard let root else {
        return true
    }
    
    var hasValidLeft = true
    var hasValidRight = true
    
    if let leftKey = root.left?.key {
        if leftKey < root.key {
            hasValidLeft = checkBST(root: root.left)
        } else {
            return false
        }
    }
    
    if let rightKey = root.right?.key {
        if rightKey > root.key {
            hasValidRight = checkBST(root: root.right)
        } else {
            return false
        }
    }
    
    return hasValidLeft && hasValidRight
}


class Tests: XCTestCase {
    
    func testIsValid1() {
        let root = Node(4)
        root.left = Node(2)
        root.right = Node(6)
        root.left?.left = Node(1)
        root.left?.right = Node(3)
        root.right?.left = Node(5)
        root.right?.right = Node(7)

        XCTAssertTrue(checkBST(root: root))
    }
    
    func testIsNotValid1() {
        let root = Node(3)
        root.left = Node(2)
        root.right = Node(4)
        root.left?.left = Node(1)
        root.right?.left = Node(5)
        root.right?.right = Node(6)

        XCTAssertFalse(checkBST(root: root))
    }

    func testIsNotValidDuplicate1() {
        let root = Node(3)
        root.left = Node(2)
        root.right = Node(5)
        root.left?.left = Node(1)
        root.right?.left = Node(6)
        root.right?.right = Node(1)

        XCTAssertFalse(checkBST(root: root))
    }
}

// Infrastructure
class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
Tests.defaultTestSuite.run()

