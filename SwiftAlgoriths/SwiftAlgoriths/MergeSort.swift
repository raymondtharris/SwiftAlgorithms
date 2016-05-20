//
//  MergeSort.swift
//  SwiftAlgoriths
//
//  Created by Tim Harris on 5/15/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation

extension Array where Element :  Comparable {
    mutating func MergeSort(index: Int, size: Int) -> Void {
        var mid: Int
        if index < size {
            mid = (size + index)/2
            self.MergeSort(index, size: mid)
            self.MergeSort(mid + 1, size: size)
            self.Merge(index, last: mid, current: size)
        }
    }
    
    mutating func Merge(first: Int, last: Int, current: Int) {
        
        let left = last - first + 1
        let right = current - last
        
        var leftArray = Array()
        var rightArray = Array()
        
        for i in 0..<left {
            leftArray.append(self[first + i - 1])
        }
        for j in 0..<right {
            rightArray.append(self[last + j])
        }
        
        // LeftArr insert Max
        // RightArr insert Max
        
        leftArray.append(INTMAX_MAX as! Element)
        rightArray.append(INTMAX_MAX as! Element)
        
        var i = 0
        var j = 0
        
        for k in (first - 1)..<current {
            if leftArray[i] <= rightArray[j] {
                self[k] = leftArray[i]
                i = i + 1
            } else {
                self[k] = rightArray[j]
                j = j + 1
            }
        }
    }
}