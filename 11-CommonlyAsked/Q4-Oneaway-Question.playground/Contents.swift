import UIKit

/*
 ___
/ _ \ _ _  ___ __ ___ __ ____ _ _  _
|(_) | ' \/ -_) _` \ V  V / _` | || |
\___/|_||_\___\__,_|\_/\_/\__,_|\_, |
                                |__/

  Challenge: There are three types of edits that can be performed on strings:
  - insert a character
  - remove a character, or
  - replace a character.
 
  Given two strings, write a function to check if they are one or zero edits away.

 */

func oneAway(_ first: String, _ second: String) -> Bool {
    if abs(first.count - second.count) != 1, second.count != first.count {
        return false
    } else if first.count == second.count {
        return replaceOneCharacter(first, second)
    } else if first.count > second.count {
        return removeOneCharacter(first, second)
    } else {
        return removeOneCharacter(second, first)
    }
}

func replaceOneCharacter(_ first: String, _ second: String) -> Bool {
    var firstArray = Array(first)
    var secondArray = Array(second)
    for i in 0..<first.count {
        if firstArray[i] != secondArray[i] {
            firstArray[i] = secondArray[i]
            return firstArray == secondArray
        }
    }
    
    return false
}

func removeOneCharacter(_ first: String, _ second: String) -> Bool {
    var firstArray = Array(first)
    var secondArray = Array(second)
    for i in 0..<first.count {
        if i == secondArray.count - 1 {
            return firstArray.dropLast() == secondArray
        }
        
        if firstArray[i] != secondArray[i] {
            firstArray.remove(at: i)
            return firstArray == secondArray
        }
    }
    return firstArray == secondArray
}

oneAway("pale", "paleXXXX")     // false
oneAway("pale", "ple")          // true
oneAway("pales", "pale")        // true
oneAway("pale", "bale")         // true
oneAway("pale", "bake")         // false
oneAway("pale", "bakeerer")     // false
