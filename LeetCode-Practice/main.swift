//
//  main.swift
//  LeetCode-Practice
//
//  Created by loop安 on 2021/10/28.
//

import Foundation



let obj = MinStack()
obj.push(0)
obj.push(-1)
obj.push(14)
obj.push(-5)
obj.push(8)
obj.push(3)
print(obj.top())
print(obj.getMin())
obj.pop()
print(obj.top())
print(obj.getMin())

obj.pop()
print(obj.top())
print(obj.getMin())
