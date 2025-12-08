import UIKit

/*
 ___            _              _
| __|_ _ __ ___| |__  ___  ___| |__
| _/ _` / _/ -_) '_ \/ _ \/ _ \ / /
|_|\__,_\__\___|_.__/\___/\___/_\_\

 Determine which elements intersect between two given arrays.
 
 */

func intersect(_ A: [Int], _ B: [Int]) -> [Int] {
    var i = 0; let m = A.count
    var j = 0; let n = B.count
    
    var intersectArray = [Int]()
    
    while i < m, j < n {
        if A[i] < B[j] {
            i += 1
        } else if B[j] < A[i] {
            j += 1
        } else {
            intersectArray.append(A[i])
            i += 1
            
        }
    }
    
    return intersectArray
}

intersect([1, 2, 4, 5, 6], [2, 3, 5, 7]) // [2, 5]
