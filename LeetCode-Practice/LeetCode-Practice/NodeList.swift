//
//  NodeList.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/10/29.
//

import Foundation

//struct NodeList {
//    public var val:Any?
//    public var next:NodeList?
//    public var pre:NodeList?
//
//    public init(){}
//
////    public init(_ val:Any,_ next:NodeList,_ pre:NodeList) {
////        self.val = val
////        self.next = next
////        self.pre = pre
////    }
//}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Node: NSObject {
    // MARK: - 简单
//    |206|反转链表||阿里||
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre:ListNode? = nil
        var cur:ListNode? = head
        
        while cur != nil {
            let temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
            
        }
        return pre
    }
//    |21|合并两个有序链表||阿里||
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var newL1 = l1
        var newL2 = l2
        let p1 = ListNode()
        var p2 = p1
        while newL1 != nil && newL2 != nil {
            if newL1!.val < newL2!.val {
                p2.next = newL1
                p2 = p2.next!
                newL1 = newL1?.next
            } else {
                p2.next = newL2
                p2 = p2.next!
                newL2 = newL2?.next
            }
        }
        if newL1 != nil {
            p2.next = newL1
        }
        if newL2 != nil {
            p2.next = newL2
        }
        return p1.next
    }
//    |141|环形链表||阿里||
//    |160|相交链表||阿里||
//    |237|删除链表中的节点||阿里||
//    |234|回文链表||阿里||
//    |203|移除链表元素||阿里||
//    |876|链表的中间结点||阿里||
//    |83|删除排序链表中的重复元素||阿里||
//    |offer 22|链表中倒数第k个节点||阿里||
    // MARK: - 中等
}
