//
//  MergeSort.swift
//  SwiftAlgoriths
//
//  Created by Tim Harris on 5/15/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation

extension Array where Element :  Comparable {
    mutating func MergeSort() -> Array<Element> {
        guard self.count > 1 else { return self }
        let mid = self.count / 2
        
        var leftArray = Array<Element>(self[0..<mid])
        let left = leftArray.MergeSort()
        var rightArray = Array<Element>(self[mid..<self.count])
        let right = rightArray.MergeSort()
        return self.Merge(left, right: right)
    }
    
    mutating func Merge(left: Array<Element>, right: Array<Element>) ->Array<Element> {
        var leftIndex = 0
        var rightIndex = 0
        var sorted = Array<Element>()
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                sorted.append(left[leftIndex])
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                sorted.append(right[rightIndex])
                rightIndex += 1
            } else {
                sorted.append(left[leftIndex])
                leftIndex += 1
                sorted.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            sorted.append(left[leftIndex])
            leftIndex += 1
        }
        while  rightIndex < right.count {
            sorted.append(right[rightIndex])
            rightIndex += 1
        }
        
        return sorted
    }
}