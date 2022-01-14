//
//  ByteDance.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2022/1/1.
//

import Foundation

class t: NSObject {
    //“I love you” 改成 “you love I”
    func string(_ str:String) -> String{
        var s = ""
        var list:[String] = []
        for c in str {
            if c != " " {
                s.append(c)
            } else {
                list.insert(s, at: 0)
                list.insert(" ",at: 0)
                s = ""
            }
        }
        if s != "" {
            list.insert(s, at: 0)
            s = ""
        }
        for i in list {
            s.append(i)
        }
        return s
    }
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let sArr = [Character](s2)
        var window:[Character:Int] = [:]
        var target:[Character:Int] = [:]
        for x in s1 {
            target[x,default: 0] += 1
        }
        
        var left = 0, right = 0
        var count = 0
        
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            
            if target[c] != nil {
                window[c,default: 0] += 1
                if window[c] == target[c] {
                    count += 1
                }
            }
            while right - left >= target.count {
                if count == target.count {
                    return true
                }
                let d = sArr[left]
                left += 1
                
                if target[d] != nil {
                    if window[d] == target[d] {
                        count -= 1
                    }
                    window[d]! -= 1
                }
            }
        }
        return false
    }
    //二分查找
    //合并n个有序数组
    //归并排序
    //数组中子数组 和最大值
//    func maxSubArray(_ nums: [Int]) -> Int {
//        var dp = [Int](repeating: 0, count: nums.count)
//        dp[0] = nums[0]
//        var res = dp[0]
//        for i in 1 ..< nums.count {
//            dp[i] = max(nums[i], dp[i - 1] + nums[i])
//            res = max(res, dp[i])
//        }
//        return res
//    }
    //1g TXT 文件 读取 从 900M到901M的内存
    //查看 IPV4 地址是否合法
    func is_ipv4(_ address:String) -> Bool{
        var list:[Bool] = []
        for x in address.split(separator: "."){
            if Int(x) != nil {
                if Int(x)! >= 0 && Int(x)! <= 255 {
                    list.append(true)
                } else {
                    list.append(false)
                }
            } else {
                list.append(false)
            }
        }
        for x in list {
            if !x {
                return false
            }
        }
        return true
    }

    
    

//    3. 无重复字符的最长子串 106
    //  O(n)
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {return 0}
        let sArr = [Character](s)
        var window = [Character:Int]()
        var res = 0
        var left = 0,right = 0
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            window[c,default:0] += 1
            
            while window[c,default: 0] > 1 {
                let d = sArr[left]
                left += 1
                window[d]! -= 1
            }
            res = max(res, right - left)
        }
        return res
    }
//    25. K 个一组翻转链表 84
//    206. 反转链表    83
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {return head}
        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
//    215. 数组中的第K个最大元素    81
//    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//
//    }
//
//    快速排序
//    func fastSort(_ nums: [Int]){
//
//    }
//    func fastSort_Helper(_ nums:[Int],_ lo:Int,_ hi:Int) {
//        if lo >= hi {return}
//        let p:Int = partition(nums, lo, hi)
//        fastSort_Helper(nums, lo, p - 1)
//        fastSort_Helper(nums, p + 1, hi)
//    }
//    func partition(_ nums:[Int],_ lo:Int,_ hi:Int) -> Int {
//        if lo == hi { return lo }
//
//    }
    
//    146. LRU缓存机制    68
//    103. 二叉树的锯齿形层次遍历    64
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return []}
        var res = [[Int]]()
        var rowRes = [Int]()
        var queue = [TreeNode]()
        var helpQueue = [TreeNode]()
        var needReverse:Bool = false
        queue.append(root)
        while queue.count != 0 || helpQueue.count != 0 {
            let node:TreeNode = queue.removeFirst()
            if node.left != nil {
                helpQueue.append(node.left!)
            }
            if node.right != nil {
                helpQueue.append(node.right!)
            }
            rowRes.append(node.val)
            if queue.count == 0 {
                queue += helpQueue
                if needReverse {
                    res.append(rowRes.reversed())
                    needReverse = false
                } else {
                    res.append(rowRes)
                    needReverse = true
                }
                rowRes.removeAll()
                helpQueue.removeAll()
            }
        }
        return res
    }
//    15. 三数之和    62
    func threeSum(_ nums: [Int],_ target:Int) -> [[Int]] {
        let nums = nums.sorted()
        var index = 0
        var res = [[Int]]()
        while index < nums.count {
            let sub = twoSum2(nums, index + 1, target - nums[index])
            for x in sub {
                var temp = x
                temp.append(nums[index])
                res.append(temp)
            }
            while index < nums.count - 1 && nums[index] == nums[index + 1] { index += 1}
            index += 1
        }
        return res
    }
//    121. 买卖股票的最佳时机    61
//    160. 相交链表    58
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p1 = headA
        var p2 = headB
        while p1!.val != p2!.val {
            if p1 == nil {
                p1 = headB
            } else {
                p1 = p1!.next
            }
            if p2 == nil {
                p2 = headA
            } else {
                p2 = p2!.next
            }
        }
        return p1
    }
//    1. 两数之和  - 返回满足条件的下标   48
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var note = [Int:Int]()
        for x in 0 ..< nums.count {
            if note[nums[x]] != nil{
                return [nums[x],x]
            } else {
                let subTarget = target - nums[x]
                note[subTarget] = x
            }
        }
        return []
    }
    
//      两数之和 - 返回所有满足条件且不重复的结果
    func twoSum2(_ nums: [Int],_ start:Int = 0, _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        var left = start,right = nums.count - 1
        var res = [[Int]]()
        while left < right {
            let sum = nums[left] + nums[right]
            let leftN = nums[left],rightN = nums[right]
            if sum > target {
                while left < right && nums[right] == rightN {right -= 1}
            } else if sum < target {
                while left < right && nums[left] == leftN {left += 1}
            } else {
                res.append([leftN,rightN])
                while left < right && nums[left] == leftN {left += 1}
                while left < right && nums[right] == rightN {right -= 1}
            }
        }
        return res
    }
//      N数之和
    func nSum(_ nums:[Int],_ n:Int,_ start:Int,_ target:Int) -> [[Int]] {
        let nums = nums.sorted()
        var index = start
        var res = [[Int]]()
        if n > nums.count || n < 2 {
            return res
        }
        if n == 2 {
            var left = start,right = nums.count - 1
            while left < right {
                let leftN = nums[left],rightN = nums[right]
                let sum = leftN + rightN
                if sum < target {
                    while left < right && nums[left] == leftN { left += 1}
                } else if sum > target{
                    while left < right && nums[right] == rightN { right -= 1}
                } else {
                    res.append([leftN,rightN])
                    while left < right && nums[left] == leftN { left += 1}
                    while left < right && nums[right] == rightN { right -= 1}
                }
            }
        } else {
            while index < nums.count {
                let sub = nSum(nums, n - 1, index + 1, target - nums[index])
                for x in sub {
                    var temp = x
                    temp.append(nums[index])
                    res.append(temp)
                }
                while index < nums.count - 1 && nums[index] == nums[index + 1] {
                    index += 1
                }
                index += 1
            }
        }
        return res
    }
    
//    236. 二叉树的最近公共祖先    45
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root.left?.val == p!.val && root.right?.val == q!.val {return root}
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil && right != nil { return root }
        if left == nil && right == nil { return nil }
        return left == nil ? right : left
    }
//    53. 最大子序和    39
    func maxSubArray(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        var dp = [Int](repeating:Int.min,count: count)
        dp[0] = nums[0]
        for i in 1 ..< count {
            dp[i] = max(nums[i],dp[i - 1] + nums[i])
        }
        var res = Int.min
        for x in dp {
            res = max(res,x)
        }
        return res
    }
//    42. 接雨水    38
//    O(n)
    func trap(_ height: [Int]) -> Int {
        if height.count == 0 {return 0}
        let n = height.count
        var left_H = [Int](repeating:0,count: n)
        var right_H = [Int](repeating:0,count:n)
        left_H[0] = height[0]
        right_H[0] = height[n - 1]
        for i in 1 ..< n {
            left_H[i] = max(left_H[i - 1],height[i])
        }
        for i in (0 ..< n - 1).reversed() {
            right_H[i] = max(right_H[i + 1],height[i])
        }
        var res = 0
        for i in 0 ..< n {
            res += min(left_H[i],right_H[i]) - height[i]
        }
        return res
    }
//    21. 合并两个有序链表    36
    // O(n)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if l1!.val < l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2)
            return l1
        } else {
            l2!.next = mergeTwoLists(l1, l2!.next)
            return l2
        }
    }
//    415. 字符串相加    36
    // O(n) || O(m)
    func addStrings(_ num1: String, _ num2: String) -> String {
        let s1 = [Character](num1)
        let s2 = [Character](num2)
        var n1 = s1.count - 1
        var n2 = s2.count - 1
        var add = 0
        var res = ""
        while n1 >= 0 || n2 >= 0 || add != 0 {
            let x = n1 >= 0 ? Int(String(s1[n1])) : 0
            let y = n2 >= 0 ? Int(String(s2[n2])) : 0
            let sum = x! + y! + add
            if sum > 9 {
                res.insert(contentsOf: String(sum - 10), at: res.startIndex)
                add = 1
            } else {
                res.insert(contentsOf: String(sum), at: res.startIndex)
                add = 0
            }
            n1 -= 1
            n2 -= 1
        }

        return res
    }
//    88. 合并两个有序数组    35
    // O(m + n)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tail = m + n - 1
        var m = m - 1,n = n - 1
        while m >= 0 || n >= 0 {
            if m < 0 {
                nums1[tail] = nums2[n]
                n -= 1
            } else if n < 0 {
                nums1[tail] = nums1[m]
                m -= 1
            } else if nums1[m] > nums2[n] {
                nums1[tail] = nums1[m]
                m -= 1
            } else {
                nums1[tail] = nums2[n]
                n -= 1
            }
            tail -= 1
        }
    }
//    199. 二叉树的右视图    34
//    O(n)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {return []}
        var res = [Int]()
        var queue = [TreeNode]()
        var helpQueue = [TreeNode]()
        queue.append(root)
        while queue.count != 0 {
            let node = queue.removeFirst()
            if node.left != nil {
                helpQueue.append(node.left!)
            }
            if node.right != nil {
                helpQueue.append(node.right!)
            }
            
            if queue.count == 0 {
                res.append(node.val)
                queue = helpQueue
                helpQueue = []
            }
        }
        return res
    }
//    102. 二叉树的层序遍历    33
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var rowRes = [Int]()
        var queue = [TreeNode]()
        var helpQueue = [TreeNode]()
        queue.append(root)
        while queue.count != 0 || helpQueue.count != 0 {
            let node = queue.removeFirst()
            if node.left != nil {
                helpQueue.append(node.left!)
            }
            if node.right != nil {
                helpQueue.append(node.right!)
            }
            rowRes.append(node.val)
            
            if queue.count == 0 {
                queue = helpQueue
                helpQueue = []
                res.append(rowRes)
                rowRes = []
            }
        }
        return res
    }
//    33. 搜索旋转排序数组    33
//    O(longN)
    func search(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        if n == 0 {return -1}
        if n == 1 {
            return nums[0] == target ? 0 : -1
        }
        var lo = 0,hi = n - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if target == nums[mid] {
                return mid
            }
            if nums[0] <= nums[mid] {
                if nums[0] <= target && target < nums[mid] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[n - 1]{
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        return -1
    }
//    200. 岛屿数量    33
//    54. 螺旋矩阵    31
//    105. 从前序与中序遍历序列构造二叉树    30
//    141. 环形链表    28
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head else {return false}
        var slow = head,fast = head
        while fast.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
            if slow.val == fast.val {
                return true
            }
        }
        return false
    }
//    101. 对称二叉树    28
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetric_Helper(root?.left,root?.right)
    }
    func isSymmetric_Helper(_ p:TreeNode?,_ q:TreeNode?) -> Bool{
        if p == nil && q == nil {return true}
        if p == nil || q == nil {return false}
        return p!.val == q!.val && isSymmetric_Helper(p!.left, q!.right) && isSymmetric_Helper(p!.right, q!.left)
    }
//    300. 最长上升子序列    28
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating:1, count:nums.count)
        
        for i in 0 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i],dp[j] + 1)
                }
            }
        }
        var res = 0
        for x in dp {
            res = max(x,res)
        }
        return res
    }
//    20. 有效的括号    28
    func isValid(_ s: String) -> Bool {
        var queue = [Character]()
        for x in s {
            switch x {
                case "(","[","{":
                    queue.append(x)
                    break
                case ")","]","}":
                    if queue.count == 0 {
                        return false
                    } else {
                        let c = queue.removeLast()
                        if x == ")" && c != "("{return false}
                        if x == "]" && c != "["{return false}
                        if x == "}" && c != "{"{return false}
                    }
                    
                    
                default:
                break
            }
        }
        if queue.count != 0 {return false}
        return true
    }
//    31. 下一个排列    27
//    69. x 的平方根    27
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {return 0}
        var res = -1
        var lo = 0,hi = x
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            let temp = mid * mid
            if temp == x {return mid}
            if temp <= x {
                res = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        return res
    }
//    56. 合并区间    25
//    23. 合并K个排序链表    25
//    143. 重排链表    25
//    46. 全排列    25
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var track = [Int]()
        permute_Helper(nums, &track, &res)
        return res
    }
    func permute_Helper(_ nums:[Int],_ track:inout [Int],_ res:inout [[Int]]) {
        
        if track.count == nums.count {
            res.append(track)
            return
        }
        
        for x in nums {
            if track.contains(x) {continue}
            track.append(x)
            permute_Helper(nums, &track, &res)
            track.removeLast()
        }
    }
//    232. 用栈实现队列    24
//    112. 路径总和    24
//    124. 二叉树中的最大路径和    24
//    5. 最长回文子串    24
//    142. 环形链表 II    23
//    94. 二叉树的中序遍历    23
//    113. 路径总和 II    23
//    92. 反转链表 II    23
//    958. 二叉树的完全性检验    22
//    补充题1. 排序奇升偶降链表    22
//    41. 缺失的第一个正数    21
//    70. 爬楼梯    20
//    155. 最小栈    20
//    129. 求根到叶子节点数字之和    20
//    2. 两数相加    19
//    98. 验证二叉搜索树    19
//    76. 最小覆盖子串    18
//    122. 买卖股票的最佳时机 II    18
//    19. 删除链表的倒数第N个节点    18
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slow = head,fast = head
        for _ in 0 ..< n {
            fast = fast?.next
        }
        if fast == nil {
            return head?.next
        }
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return head
    }
//    169. 多数元素    18
//    剑指 Offer 22. 链表中倒数第k个节点    18
//    39. 组合总和    18
//    470. 用 Rand7() 实现 Rand10()    18
//    165. 比较版本号    18
//    543. 二叉树的直径    17
//    162. 寻找峰值    17
//    32. 最长有效括号    17
//    240. 搜索二维矩阵 II    17
//    93. 复原IP地址    17
//    209. 长度最小的子数组    17
//    226. 翻转二叉树    16
//    48. 旋转图像    16
//    718. 最长重复子数组    16
//    补充题4. 手撕快速排序    16
//    518. 零钱兑换 II    15
//    64. 最小路径和    15
//    234. 回文链表    15
//    110. 平衡二叉树    15
//    83. 删除排序链表中的重复元素    15
//    322. 零钱兑换    15
//    62. 不同路径    14
//    104. 二叉树的最大深度    14
//    148. 排序链表    14
//    82. 删除排序链表中的重复元素 II    14
//    198. 打家劫舍    14
//    151. 翻转字符串里的单词    13
//    230. 二叉搜索树中第K小的元素    13
//    1143. 最长公共子序列    13
//    4. 寻找两个正序数组的中位数    13
//    239. 滑动窗口最大值    13
//    补充题2. 圆环回原点问题    13
//    78. 子集    12
//    72. 编辑距离    12
//    剑指 Offer 09. 用两个栈实现队列    11
//    695. 岛屿的最大面积    11
//    144. 二叉树的前序遍历    11
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {return []}
        var list = [Int]()
        list += preorderTraversal(root.left)
        list += preorderTraversal(root.right)
        return list
    }
//    394. 字符串解码    11
//    8. 字符串转换整数 (atoi)    11
//    24. 两两交换链表中的节点    11
//    补充题9. 36进制加法    11
//    128. 最长连续序列    10
//    704. 二分查找    10
//    739. 每日温度    10
//    224. 基本计算器    10
//    79. 单词搜索    10
//    221. 最大正方形    9
//    22. 括号生成    9
//    剑指 Offer 36. 二叉搜索树与双向链表
    
}

class NewNode {
    var pre:NewNode?
    var next:NewNode?
    var key:Int?
    var value:Int?
    
    init(_ key:Int,_ value:Int) {
        self.pre = nil
        self.next = nil
        self.key = key
        self.value = value
    }
}

class DoubleList {
    var head:NewNode?
    var tail:NewNode?
    var size:Int?
    
    init() {
        head = NewNode(0, 0);
        tail = NewNode(0, 0);
        head!.next = tail;
        tail!.pre = head;
        size = 0;
    }
    func addLast(_ x:NewNode) {
        x.pre = tail?.pre
        x.next = tail
        tail!.pre!.next = x
        tail!.pre = x
        size! += 1
    }
    
    func remove(_ x:NewNode){
        x.pre?.next = x.next
        x.next?.pre = x.pre
        size! -= 1
    }
    
    func removeFirst() -> NewNode?{
        if head?.next === tail {
            return nil
        }
        let x = head!.next!
        remove(x)
        return x
    }
    
    func listSize() -> Int{
        return size!
    }
}

class LRUCache {
    
    var map:[Int:NewNode]?
    var cache:DoubleList?
    var cap:Int?
    
    init(_ capacity:Int) {
        cap = capacity
        map = [Int:NewNode]()
        cache = DoubleList()
    }
    
    func makeRecently(key:Int){
        guard let node:NewNode = map?[key] else {
            return
        }
        cache?.remove(node)
        cache?.addLast(node)
    }
    
    func addRecently(key:Int){
        guard let node:NewNode = map?[key] else { return }
        cache?.addLast(node)
        map![key] = node
    }
    
    func delete(key:Int){
        guard let node:NewNode = map?[key] else { return }
        cache?.remove(node)
        map?.removeValue(forKey: key)
    }
    func removeRencently(){
        guard let node:NewNode = cache?.removeFirst() else {return }
        let key = node.key
        map?.removeValue(forKey: key!)
    }
    
}

 class Solution {
     func checkInclusion(_ s1: String, _ s2: String) -> Bool {
         let sArr = [Character](s2)
         
         var window = [Character:Int]()
         var need = [Character:Int]()
         for i in s1 { need[i] = 1 + (need[i] ?? 0) }
         var left = 0,right = 0
         var count = 0
         
         while right < sArr.count {
             let c = sArr[right]
             right += 1
             
             if need[c] != nil {
                 window[c] = 1 + (window[c] ?? 0)
                 if window[c] == need[c] {
                     count += 1
                 }
             }
             while right - left >= s1.count {
                 if count == need.count {
                     return true
                 }
                 let d = sArr[left]
                 left += 1
                 
                 if need[d] != nil {
                     if window[d] == need[d] {
                         count -= 1
                     }
                     window[d]! -= 1
                 }
             }
         }
         return false
     }
 }
 
