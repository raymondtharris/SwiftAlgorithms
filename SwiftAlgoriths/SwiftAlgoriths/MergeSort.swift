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
        
    }
}