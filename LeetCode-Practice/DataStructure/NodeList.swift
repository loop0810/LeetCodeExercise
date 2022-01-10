//
//  NodeList.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/10/29.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        // 用于唯一标识
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }

    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
 }

class Node: NSObject {
    // MARK: - 简单
//    |206|反转链表||阿里||
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 遍历实现
//        var pre:ListNode? = nil
//        var cur:ListNode? = head
//
//        while cur != nil {
//            let temp = cur?.next
//            cur?.next = pre
//            pre = cur
//            cur = temp
//        }
//        return pre
        // 递归实现
        if (head == nil || head?.next == nil) { return head}
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }
    // 反转前N个节点
    var successor:ListNode? = nil
    func reverseListN(_ head: ListNode?,_ n:Int) -> ListNode? {
        // 迭代实现
//        var pre:ListNode? = nil
//        var cur:ListNode? = head
//        while (cur!.val != n) {
//            let temp = cur?.next
//            cur?.next = pre
//            pre = cur
//            cur = temp
//        }
//        return pre
        if n == 1 {
            successor = head?.next
            return head
        }
        let node = reverseListN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor
        return node
    }
    // 反转链表区间
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseListN(head, right)
        }
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
    // K个一组反转链表
    
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
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow:ListNode? = head
        var fast:ListNode? = head?.next
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
//    |160|相交链表||阿里||
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var hashSet = Set<ListNode>()
        var current = headA
        while current != nil {
            hashSet.insert(current!)
            current = current!.next
        }
        current = headB
        
        while current != nil {
            if hashSet.contains(current!) {
                break
            }
            current = current?.next
        }
        
        return current
    }
//    |237|删除链表中的节点||阿里||
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
//    |234|回文链表||阿里||
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        var list:[ListNode] = []
        while fast != nil && fast?.next != nil {
            list.append(slow!)
            slow = slow?.next
            fast = fast?.next?.next
        }
        // 当fast.next ！= nil时，链表数为奇数，慢指针前进一个避开中间结点
        if fast != nil && fast?.next == nil {
            slow = slow?.next
        }
        while slow != nil {
            let node = list.popLast()
            if slow!.val == node!.val {
                slow = slow?.next
            } else {
                return false
            }
        }
        return true
    }
//    |203|移除链表元素||阿里||
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let temphead = ListNode(0)
        temphead.next = head
        var p2 = temphead
        while p2.next != nil {
            if p2.next?.val == val {
                p2.next = p2.next?.next
            } else {
                p2 = p2.next ?? ListNode(0)
            }
        }
        return temphead.next
    }
//    |876|链表的中间结点||阿里||
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
//    |83|删除排序链表中的重复元素||阿里||
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dumy = ListNode(-1)
        var newHead = head
        dumy.next = newHead
        
        while newHead != nil {
            if newHead?.val == newHead?.next?.val  {
                newHead?.next = newHead?.next?.next
            } else {
                newHead = newHead?.next
            }
        }
        return dumy.next
    }
//    |offer 22|链表中倒数第k个节点||阿里||
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head
        var fast = head
        
        for _ in 0 ..< k {
            fast = fast?.next
        }
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
    // MARK: - 中等
//    |2|两数相加||阿里||
//    |146|LRU 缓存机制||阿里||
//    |19|删除链表的倒数第 N 个结点||阿里||
//    |148|排序链表||阿里||
//    |138|复制带随机指针的链表||阿里||
//    |142|环形链表 II||阿里||
//    |24|两两交换链表中的节点||阿里||
//    |61|旋转链表||阿里||
//    |92|反转链表 II||阿里||
//    |328|奇偶链表||阿里||
//    |114|二叉树展开为链表||阿里||
//    |143|重排链表||阿里||
//    |82|删除排序链表中的重复元素 II||阿里||
//    |147|对链表进行插入排序||阿里||
}
