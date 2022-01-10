//
//  Sword.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/12/30.
//

import Foundation

// 30.包含min函数的栈
// 9. 用两个栈实现队列
// 31.栈的入栈、出栈


class Sword_Base: NSObject {
    // 15.二进制中1的个数
    func hammingWeight(_ n: Int) -> Int {
        var num = n
        var res = 0
        while num != 0 {
            if num & 1 == 1{
                res += 1
            }
            num = num >> 1
        }
        return res
    }
    // 16.数值的整数次方
    func myPow(_ x: Double, _ n: Int) -> Double {
        
//        if n == 0 {
//            return 1
//        }
//        var res = x
//        if n > 0 {
//            for _ in 1 ..< n {
//                res *= x
//            }
//        } else {
//            for _ in n ... 0 {
//                res /= x
//            }
//        }
//
        return x
    }
    func printNumbers(_ n: Int) -> [Int] {
        var num = 1
        for _ in 1 ... n {
            num *= 10
        }
        var res:[Int] = []
        for x in 1 ..< num {
            res.append(x)
        }
        return res
    }
}

class Sword_List: NSObject {
    // 3.数组中重复的数字
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var dic:[Int:Int] = [:]
        for x in nums {
            if dic[x] == 1 {
                return x
            } else {
                dic[x] = 1
            }
        }
        return 0
    }
    // 4.二维数组中的查找
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        var result = false
        //防空判定
        if matrix.count <= 0 {
            return result
        }

        //取得总体的行和列
        let rows = matrix.count
        let columns = matrix[0].count

        var currentRow = 0
        var currentColumn = columns - 1;
        //开始循环，条件如下，currentColumn >= 0,可以等于0
        while currentRow < rows && currentColumn >= 0 {
            let tempValue = matrix[currentRow][currentColumn]
            if tempValue == target { //当前坐标值和目标值相等直接返回
                result = true
                return result
            } else if tempValue > target { //当前坐标值大于目标值，剔除当前列
                currentColumn -= 1
            } else if tempValue < target {  //当前坐标值小于目标值，剔除当前行
                currentRow += 1
            }
        }

        return result
    }
    // 11.旋转数组的最小数字
    func minArray(_ numbers: [Int]) -> Int {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if numbers[mid] > numbers[left] {
                left = mid + 1
            } else if numbers[mid] < numbers[right]{
                right = mid
            } else {
                right -= 1
            }
        }
        return numbers[left]
    }
    // 21.调整数组顺序使奇数位于偶数前面
    func exchange(_ nums: [Int]) -> [Int] {
        var res = nums
        var left = 0
        var right = nums.count - 1
        while left <= right {
            if res[left] % 2 == 0 {
                while res[right] % 2 == 0 && left < right{
                    right -= 1
                }
                let temp = res[right]
                res[right] = res[left]
                res[left] = temp
            }
            left += 1
        }
        return res
    }
    // 39.数组中出现次数超过一半的数字
    func majorityElement(_ nums: [Int]) -> Int {
        var note:[Int:Int] = [:]
        for x in nums {
            note[x,default: 0] += 1
        }
        for x in note {
            if x.value > nums.count / 2 {
                return x.key
            }
        }
        return 0
    }
    // 40.最小的K个数
    
}

class Sword_String: NSObject {
    // 5.替换空格
    func replaceSpace(_ s: String) -> String {
        let sArr = [Character](s)
        var res = ""
        for x in sArr {
            if x == " " {
                res.append("%20")
            } else {
                res.append(x)
            }
        }
        return res
    }
    // 20.表示数值的字符串
    // 38.字符串的排列
}

class Sword_NodeList: NSObject {
    // 6.从尾到头a打印链表
    func reversePrint(_ head: ListNode?) -> [Int] {
        var pre:ListNode? = nil
        var cur:ListNode? = head
        var res:[Int] = []
        
        while cur != nil {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }

        while pre != nil {
            res.append(pre!.val)
            pre = pre?.next
        }
        return res
        
    }
    // 18.删除链表的节点
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        var p = head
        if head?.val == val {
            return head?.next
        }
        while p?.next != nil {
            if p?.next?.val == val {
                p?.next = p?.next?.next
            }
            p = p?.next
        }
        return head
    }
    // 22.立案表中倒数第K个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head
        var fast = head
        for _ in 0 ..< k {
            if fast != nil {
                fast = fast?.next
            } else {
                return nil
            }
        }
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
    // 24.反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil || head == nil{
            return head
        }
        
        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
    // 25.合并两个排序的链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        
        let res = ListNode()
        var p = res
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                p.next = l1
                p = p.next!
                l1 = l1?.next
            } else {
                p.next = l2
                p = p.next!
                l2 = l2?.next
            }
        }
        if l1 != nil {
            p.next = l1
        }
        if l2 != nil {
            p.next = l2
        }
        return res.next
    }
    // 35.复杂链表的赋值
    
}

class Sword_TreeNode: NSObject {
    // 7.重建二叉树
//    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//
//    }
//    func buildTree_Helper()
    // 26.树的子结构
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        var result: Bool = false
        if A != nil && B != nil {
            //在根节点值相同的情况下，再去判断其是否存在相同的结构
            if A!.val == B!.val {
                result = isSubStructure_Helper(A, B)
            }
            //如果前面的节点找不到存在的，则继续根据其左子节点递归遍历
            if !result {
                result = isSubStructure(A?.left, B)
            }
            //如果前面的节点找不到存在的，则继续根据其右子节点递归遍历
            if !result {
                result = isSubStructure(A?.right, B)
            }
        }
        return result
    }
    
    func isSubStructure_Helper(_ A: TreeNode?, _ B: TreeNode?) -> Bool{
        //当递归调用传入的B子节点为空时，说明已经完全把B树都遍历完了
        // 在A之前判断，防止B的叶子节点恰好是A的叶子节点时，A == nil，返回false
        if B == nil {
            return true
        }
        if A == nil {
            return false
        }
        if A!.val != B!.val {
            return false
        }
        //继续递归调用
        return isSubStructure_Helper(A?.left, B?.left) && isSubStructure_Helper(A?.right, B?.right)
    }
    // 27.二叉树的镜像
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }

        let temp = root.left
        root.left = root.right
        root.right = temp
        
        _ = mirrorTree(root.left)
        _ = mirrorTree(root.right)
        
        return root
        
    }
    // 28.对称的二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return root == nil ? true : isSymmetric_Helper(root?.left, root?.right)
    }
    func isSymmetric_Helper(_ left: TreeNode?,_ right: TreeNode?) -> Bool {
        if left == nil && right == nil{
            return true
        }
        if left == nil || right == nil || left!.val != right!.val  {
            return false
        }
        return isSymmetric_Helper(left?.left, right?.right) && isSymmetric_Helper(left?.right, right?.left)
    }
    // 32 - 1.从上到下打印二叉树 1
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var queue:[TreeNode] = [root]
        var res:[Int] = []
        while queue.count != 0 {
            let temp = queue.removeFirst()
            res.append(temp.val)
            if temp.left != nil{
                queue.append(temp.left!)
            }
            if temp.right != nil{
                queue.append(temp.right!)
            }
        }
        return res
    }

    // 32 - 1.从上到下打印二叉树 2
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var queue:[TreeNode] = []
        var subQueue:[TreeNode] = [root]
        var res:[[Int]] = []
        var list:[Int] = []
        while queue.count != 0 || subQueue.count != 0 {
            if queue.count == 0 {
                queue += subQueue
                subQueue.removeAll()
            }
            let temp = queue.removeFirst()
            list.append(temp.val)
            if temp.left != nil {
                subQueue.append(temp.left!)
            }
            if temp.right != nil {
                subQueue.append(temp.right!)
            }
            if queue.count == 0 {
                res.append(list)
                list.removeAll()
            }
        }
        return res
    }
    // 32 - 1.从上到下打印二叉树 3
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var queue:[TreeNode] = []
        var subQueue:[TreeNode] = [root]
        var res:[[Int]] = []
        var list:[Int] = []
        while queue.count != 0 || subQueue.count != 0 {
            if queue.count == 0 {
                queue += subQueue
                subQueue.removeAll()
            }
            let temp = queue.removeFirst()
            list.append(temp.val)
            if temp.left != nil {
                subQueue.append(temp.left!)
            }
            if temp.right != nil {
                subQueue.append(temp.right!)
            }
            if queue.count == 0 {
                res.append(list)
                list.removeAll()
            }
        }
        for i in 1 ..< res.count {
            if i % 2 == 0 {
                res[i].reverse()
            }
        }
        return res
    }
    // 33.二叉搜索树的后序遍历
//    func verifyPostorder(_ postorder: [Int]) -> Bool {
//
//        }
    // 34.二叉树中和为某一值得路径
    // 36.二叉搜索树和双向链表
    
}

class Sword_Matrix: NSObject {
    // 12.矩阵中的路径
    // 29.顺时针打印矩阵
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return []
        }
        var col = matrix.first!.count
        var x = 0
        var y = 0
        var flag = true
        var res:[Int] = []
        while flag {
            while x < col {
                res.append(matrix[x][y])
                x += 1
            }
        }
    }
}

class Sword_Recursion: NSObject {
    // 10 - 1.斐波那契数列
    func fib(_ n: Int) -> Int {

        var note:[Int:Int] = [:]
        return fib_Helper(n, note: &note)
    }
    func fib_Helper(_ n:Int,note:inout [Int:Int]) -> Int{
        if n == 0 || n == 1{
            return n
        }
        if (note[n] == nil) {
            // 当N较大时，这一步会出现数值溢出，使用取模的方式避免
            let res = fib_Helper(n - 1, note: &note) + fib_Helper(n - 2, note: &note)
            note[n] = res
            return res
        }
        return note[n]!
    }
    
    
}

class Sword_Dynamic: NSObject {
    // 10 - 2.台阶问题
    func numWays(_ n: Int) -> Int {
        var dp:[Int] = Array(repeating: 0, count: n + 1)
        return numWays_Helper(n, &dp)
    }
    func numWays_Helper(_ n:Int, _ dp:inout [Int]) -> Int {
        if n == 0 || n == 1 {
            return 1
        }
        if dp[n] == 0 {
            let res = (numWays_Helper(n - 1, &dp) + numWays_Helper(n - 2, &dp)) % 1000000007
            dp[n] = res
            return res
        }
        return dp[n]
    }
    
    // 14 - 1.剪绳子
    // 14 - 2.剪绳子2
}


