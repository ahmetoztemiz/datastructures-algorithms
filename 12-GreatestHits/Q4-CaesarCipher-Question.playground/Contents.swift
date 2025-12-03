import UIKit

/*
 ___                          ___ _      _
/ __|__ _ ___ ___ __ _ _ _   / __(_)_ __| |_  ___ _ _
|(__/ _` / -_|_-</ _` | '_| | (__| | '_ \ ' \/ -_) '_|
\___\__,_\___/__/\__,_|_|    \___|_| .__/_||_\___|_|
                                   |_|

 // Challenge: Implement a Caesar Cipher.
         //
         // A Caesar Cipher is a basic encryption algorithm that takes all the letters message
         // and encrypts them by shifting them over some fixed amount.
         //
         // For example a Caesar Cipher of x3 would map the alphabet like this:
         //
         // Plain:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
         // Cipher:   XYZABCDEFGHIJKLMNOPQRSTUVW
         //
         // And the following text like this:
         //
         // Plaintext:  THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
         // Ciphertext: QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD
         //
         // Write an encrypt and decrypt method of a Caesar Cipher using an offset of 3
         //
 */

class CaesarCipher {
    func encrypt(_ plainText: String) -> String {
        let offset = 3
        let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        var encrptedText = ""
        var nextIndex = 0
        let letterIndex: [Character: Int] = letters.reduce(into: [:]) { result, char in
            result[Character(char)] = nextIndex
            nextIndex += 1
        }
        
        for ch in Array(plainText) {
            guard let index = letterIndex[ch] else {
                if ch.isWhitespace {
                    encrptedText.append(" ")
                }
                continue
            }
            let encryptedIndex = index - offset >= 0 ? index - offset : index - offset + letters.count
            encrptedText.append(letters[encryptedIndex])
        }
        
        return encrptedText
    }
}

let cipher = CaesarCipher()

cipher.encrypt("ABC")                       // XYZ
cipher.encrypt("ATTACK AT FIRST LIGHT")     // XQQXZH XQ CFOPQ IFDEQ
cipher.encrypt("MEET AT THE RUBICON")       // JBBQ XQ QEB ORYFZLK

