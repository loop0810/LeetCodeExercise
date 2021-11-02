//
//  Recursion.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/2.
//

import Foundation

class Recursion_Code: NSObject {
//    |206|反转链表||阿里||
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil && head?.next == nil {
            return head
        }
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
//    |21|合并两个有序链表||阿里||
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
        
    }
//    |234|回文链表||阿里||
    func isPalindrome(_ head: ListNode?) -> Bool {
        
    }
//    |offer 62|圆圈中最后剩下的数字||阿里||
//    |203|移除链表元素||阿里||
//    |231|2的幂||阿里||
//    |509|斐波那契数列||阿里||
}
