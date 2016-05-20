//
//  BubbleSort.swift
//  SwiftAlgoriths
//
//  Created by Tim Harris on 5/19/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation

extension Array where Element : Comparable {
    mutating public func BubbleSort(){
        for i in 0..<self.count {
            var j = self.count - 1
            while (j > i) {
                let temp = self[j]
                self[j] = self[j - 1]
                self[j - 1] = temp
                j = j - 1
            }
        }
    }
}