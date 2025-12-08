import UIKit
import XCTest

/*
   _
  /_\  _ __  __ _ ______ _ _
 / _ \| '  \/ _` |_ / _ \ ' \
/_/ \_\_|_|_\__,_/__\___/_||_|

 Write an algorithm that merges these two arrays into one.
 
 */

func merge(_ A: [Int], _ B: [Int]) -> [Int] {
    var i = 0; let m = A.count;
    var j = 0; let n = B.count;
    
    var merged: [Int] = []
    
    while i < m || j < n {
        if i == m {
            merged.append(B[j])
            j += 1
        } else if j == n {
            merged.append(A[i])
            i += 1
        } else if A[i] < B[j] {
            merged.append(A[i])
            i += 1
        } else {
            merged.append(B[j])
            j += 1
        }
    }
    
    return merged
}

merge([1, 3, 5, 7], [2, 5, 8, 11, 14]) // [1, 2, 3, 5, 5, 7, 8, 11, 14]



class Tests: XCTestCase {

    func testMerge() {
        let expected = [1, 2, 3, 5, 5, 7, 8, 11, 14]
        let actual = merge([1, 3, 5, 7], [2, 5, 8, 11, 14])
        XCTAssertEqual(expected, actual)
    }
 
    func testL1Empty() {
        let expected = [2, 5, 8, 11, 14]
        let actual = merge([], [2, 5, 8, 11, 14])
        XCTAssertEqual(expected, actual)
    }
    
    func testL2Empty() {
        let expected = [1, 3, 5, 7]
        let actual = merge([1, 3, 5, 7], [])
        XCTAssertEqual(expected, actual)
    }

    func testNoOverlap() {
        let expected = [1, 2, 3, 4, 5, 6]
        let actual = merge([1, 2, 3], [4, 5, 6])
        XCTAssertEqual(expected, actual)
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




