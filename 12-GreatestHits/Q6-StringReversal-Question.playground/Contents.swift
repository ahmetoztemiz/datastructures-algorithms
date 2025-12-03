import UIKit

/*
 ___ _       _             ___                          _
/ __| |_ _ _(_)_ _  __ _  | _ \_____ _____ _ _ ___ __ _| |
\__ \  _| '_| | ' \/ _` | |   / -_) V / -_) '_(_-</ _` | |
|___/\__|_| |_|_||_\__, | |_|_\___|\_/\___|_| /__/\__,_|_|
                   |___/
 
 // Challenge: Given a string, return it's reverse.
 // "abc" => "cba"

 */

func reverse(_ text: String) -> String {
    var textArray = Array(text)
    var leftIndex = 0
    var rightIndex = text.count - 1
    
    for i in 0..<text.count / 2 {
        let tempChar = textArray[leftIndex]
        textArray[leftIndex] = textArray[rightIndex]
        textArray[rightIndex] = tempChar
        
        leftIndex += 1
        rightIndex -= 1
    }
    
    return String(textArray)
}

reverse("Hello")    // olleH
reverse("Sam")      // maS
