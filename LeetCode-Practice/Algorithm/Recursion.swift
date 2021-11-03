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
//    func isPalindrome(_ head: ListNode?) -> Bool {
//
//    }
//    |offer 62|圆圈中最后剩下的数字||阿里||
    func l(_ n: Int, _ m: Int) -> Int {
        if n == 1 {
            return 0
        }
        let x = l(n-1,m)
        return (m + x) % n
    }
    
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        return l(n, m)
    }
//    |203|移除链表元素||阿里||
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        head?.next = removeElements(head?.next, val)
        return head?.val == val ? head?.next : head
    }
//    |231|2的幂||阿里||
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n > 0 {
            if n == 1 {
                return true
            }
            if (n % 2 == 1) {
                return false
            }
            return isPowerOfTwo(n/2)
        }
        return false
    }
//    |509|斐波那契数列||阿里||
    func f( memo:inout [Int:Int], _ n: Int) -> Int{
        if n == 0 || n == 1 {
            return n
        }
        if memo[n] == nil {
            let x = f(memo: &memo, n - 1) + f(memo: &memo, n - 2)
            memo[n] = x
            return x
        }
        return memo[n]!
    }
    
    func fib(_ n: Int) -> Int {
        var memo:[Int:Int] = [:]
        
        return f(memo: &memo, n)
    }
}
