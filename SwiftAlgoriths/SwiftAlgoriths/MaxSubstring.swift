//
//  MaxSubstring.swift
//  SwiftAlgoriths
//
//  Created by Tim Harris on 5/25/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation

extension String {
    
    mutating func maxSubstringWithUniqueCharacters(uniqueChars: Int) -> String {
        var substrings = self.findAllSubstring(self, uniqueCount: uniqueChars)
        quickSortByLength(substrings, low: 1, high: substrings.count)
        print(substrings)
        return substrings[substrings.count-1]
    }
    
    private func findAllSubstring(aString: String, uniqueCount: Int) -> [String] {
        var returnSubstrings = [String]()
        for i in 0..<aString.characters.count {
            for j in (i+1)...aString.characters.count {
                var stringSplice = aString.substringWithRange(Range<String.Index>(start: aString.startIndex.advancedBy(i), end: aString.startIndex.advancedBy(j)))
                var chars = [String]()
                for k in 0..<stringSplice.characters.count {
                    if !chars.contains(stringSplice.substringWithRange(Range<String.Index>(start: stringSplice.startIndex.advancedBy(k), end: stringSplice.startIndex.advancedBy(k+1)))) {
                        chars.append(stringSplice.substringWithRange(Range<String.Index>(start: stringSplice.startIndex.advancedBy(k), end: stringSplice.startIndex.advancedBy(k+1))))
                    }
                }
                if chars.count < (uniqueCount + 1) {
                    returnSubstrings.append(stringSplice)
                }
                
            }
        }
        return returnSubstrings
    }
    
    private mutating func quickSortByLength(substrings: [String], low: Int, high: Int) {
        var mid: Int
        if low < high {
            mid = partition(substrings, low: low, high: high)
            quickSortByLength(substrings, low: low, high: mid - 1 )
            quickSortByLength(substrings, low: mid + 1, high: high)
        }
    }
    
    private mutating func partition(var substrings: [String], low: Int, high: Int) -> Int {
        let valueToCompare = substrings[high - 1].characters.count
        var i = low - 1
        for j in low..<high {
            if substrings[j - 1].characters.count <= valueToCompare {
                i = i + 1
                let temp = substrings[i - 1]
                substrings[i - 1] = substrings[j - 1]
                substrings[j - 1 ] = temp
                
            }
        }
        let temp2 = substrings[i]
        substrings[i] = substrings[high - 1]
        substrings[high - 1] = temp2
        return i + 1
    }
}

