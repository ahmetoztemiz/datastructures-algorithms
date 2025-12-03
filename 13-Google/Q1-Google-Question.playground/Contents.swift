import UIKit

/*
 ___                _
/ __|___  ___  __ _| |___
|(_ / _ \/ _ \/ _` | / -_)
\___\___/\___/\__, |_\___|
              |___/
 
 Given a set of numbers, determine if there is a pair that equals a given sum.
 
 */

func hasPairWithSum(_ arr: [Int], _ sum: Int) -> Bool {
    let missingInt = arr.reduce(into: [Int: Int]()) { result, i in
        result[i, default: 0] += 1
    }
    
    for i in arr {
        if let missingIntCount = missingInt[sum - i] {
            if i == sum - i {
                return missingIntCount > 1
            } else {
                return true
            }
        }
    }
    
    return false
}

func hasPairWithSum2(_ arr: [Int], _ sum: Int) -> Bool {
    var diff = Set<Int>()
    for i in arr {
        if diff.contains(sum - i) {
            return true
        }
        
        diff.insert(sum - i)
    }
    
    return false
}

hasPairWithSum([1, 2, 4, 9], 8)     // false
hasPairWithSum([1, 2, 4, 4], 8)     // true
hasPairWithSum([1, 2, 4], 8)     // false

hasPairWithSum2([1, 2, 4, 9], 8)     // false
hasPairWithSum2([1, 2, 4, 4], 8)     // true
hasPairWithSum2([1, 2, 4], 8)     // false

