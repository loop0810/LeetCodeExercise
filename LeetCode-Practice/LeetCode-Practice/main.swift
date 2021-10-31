//
//  main.swift
//  LeetCode-Practice
//
//  Created by loop安 on 2021/10/28.
//

import Foundation


var l = List_Code()
//print(l.findKthPositive([2,3,4,7,11], 5))

var n1 = ListNode(1)
var n2 = ListNode(2)
var n7 = ListNode(6)
var n3 = ListNode(3)
var n4 = ListNode(4)
var n5 = ListNode(5)
var n6 = ListNode(6)
n1.next = n2
n2.next = n7
n7.next = n3
n3.next = n4
n4.next = n5
n5.next = n6

var n = Node()
//print(n.hasCycle([]))
print(n.removeElements(n1, 6))
