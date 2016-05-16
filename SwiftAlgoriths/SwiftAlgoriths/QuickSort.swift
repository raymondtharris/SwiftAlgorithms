//
//  QuickSort.swift
//  SwiftAlgoriths
//
//  Created by Tim Harris on 5/15/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation

extension Array where Element : Comparable {
    mutating func QuickSort(first: Int, last: Int, randomPartition: Bool) -> Void {
        var mid: Int
        if first < last  && randomPartition == true{
            mid = self.RandomizedPartition(first, last: last)
            self.QuickSort(first, last: mid - 1, randomPartition: true)
            self.QuickSort( mid + 1, last: last, randomPartition: true)
        } else if first < last && randomPartition == false {
            mid = self.Partition(first, last: last)
            self.QuickSort(first, last: mid - 1, randomPartition: false)
            self.QuickSort(mid + 1, last: last, randomPartition: false)
        }
    }
    
    mutating func Partition( first: Int, last: Int) -> Int {
        let valueToCompare = self[last - 1]
        var i = first - 1
        for j in first..<last {
            if self[j - 1] <= valueToCompare {
                i = i + 1
                let temp = self[i - 1]
                self[i - 1] = self[j - 1]
                self[j - 1 ] = temp
                
            }
        }
        let temp2 = self[i]
        self[i] = self[last - 1]
        self[last - 1] = temp2
        return i + 1
    }
    
    
    mutating func RandomizedPartition( first: Int, last: Int) -> Int {
        var i = Int(arc4random_uniform(UInt32(last))) + first
        
        if i > last {
            i = last
        }
        let temp = self[i - 1]
        self[i - 1] = self[last - 1]
        self[last - 1] = temp
        return self.Partition(first, last: last)
    }
}

