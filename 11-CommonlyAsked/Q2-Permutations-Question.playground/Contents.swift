import UIKit

/*
 ___                   _        _   _
| _ \___ _ _ _ __ _  _| |_ __ _| |_(_)___ _ _  ___
|  _/ -_) '_| '  \ || |  _/ _` |  _| / _ \ ' \(_-<
|_| \___|_| |_|_|_\_,_|\__\__,_|\__|_\___/_||_/__/

 Challenge: Given two strings, check if one is a permutation of the other.
 
 */

func isPermutation(_ text: String, _ perm: String) -> Bool {
    for c in text {
        if !perm.contains("c") {
            return false
        }
    }
    return true
}

func isPermutationWithSorting(_ text: String, _ perm: String) -> Bool {
    if text.count != perm.count {
        return false
    }
    
    return text.sorted() == perm.sorted()
}

isPermutation("abc", "cba") // true
isPermutation("abc", "xyz") // false

isPermutationWithSorting("abc", "cba") // true
isPermutationWithSorting("abc", "xyz") // false
