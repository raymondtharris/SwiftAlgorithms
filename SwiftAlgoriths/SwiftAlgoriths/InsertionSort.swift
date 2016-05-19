//
//  InsertionSort.swift
//  SwiftAlgoriths
//
//  Created by Tim Harris on 5/18/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation

extension Array where Element : Comparable {
    mutating func InsertionSort(){
        var temp: Element
        for j in 1..<self.count {
            temp = self[j]
            var i = j - 1
            while i > -1 && self[i] > temp {
                self[i + 1] = self[i]
                i = i - 1
            }
            self[i + 1] = temp
        }
    }
}