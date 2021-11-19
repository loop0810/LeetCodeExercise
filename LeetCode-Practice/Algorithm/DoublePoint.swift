//
//  DoublePoint.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/19.
//

import Foundation

class DoublePoint_Code: NSObject {
    //    141.环形链表（简单）
        func hasCycle(_ head: ListNode?) -> Bool {
            var slow = head,fast = head?.next
            while fast?.next != nil {
                if slow === fast {
                    return true
                }
                slow = slow?.next
                fast = fast?.next?.next
            }
            return false
        }
    //    142.环形链表II（简单）
        func detectCycle(_ head: ListNode?) -> ListNode? {
            var slow = head,fast = head
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
                if slow === fast { break }
            }
            if fast == nil || fast?.next == nil { return nil }
            slow = head
            while slow !== fast {
                slow = slow?.next
                fast = fast?.next
            }
            return slow
        }
    //    167.两数之和 II - 输入有序数组（中等）
        func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
            var left = 0,right = numbers.count - 1
            while left < right {
                if numbers[left] + numbers[right] > target {
                    right -= 1
                } else if numbers[left] + numbers[right] < target{
                    left += 1
                } else {
                    return [left + 1,right + 1]
                }
            }
            return []
        }
    //    344.反转字符串（简单）
        func reverseString(_ s: inout [Character]) {
            var left = 0,right = s.count - 1
            
            while left < right {
                let temp = s[right]
                s[right] = s[left]
                s[left] = temp
                left += 1
                right -= 1
            }
            print(s)
        }
    //    19.删除链表倒数第 N 个元素（中等）
        func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
            var slow = head,fast = head
            for _ in 0 ..< n { fast = fast?.next }
            if fast == nil {
                return head?.next
            }
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next
            }
            slow?.next = slow?.next?.next
            return head
        }
    //    876. 链表的中间结点
        func middleNode(_ head: ListNode?) -> ListNode? {
            var slow = head,fast = head
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            return slow
        }
}

// MARK: - 滑动窗口
/**
 /* 滑动窗口算法框架 */
 void slidingWindow(string s, string t) {
     unordered_map<char, int> need, window;
     for (char c : t) need[c]++;
     
     int left = 0, right = 0;
     int valid = 0;
     while (right < s.size()) {
         // c 是将移入窗口的字符
         char c = s[right];
         // 右移窗口
         right++;
         // 进行窗口内数据的一系列更新
         ...

         /*** debug 输出的位置 ***/
         printf("window: [%d, %d)\n", left, right);
         /********************/
         
         // 判断左侧窗口是否要收缩
         while (window needs shrink) {
             // d 是将移出窗口的字符
             char d = s[left];
             // 左移窗口
             left++;
             // 进行窗口内数据的一系列更新
             ...
         }
     }
 }
 */
extension DoublePoint_Code{
    // 76. 最小覆盖子串
    func minWindow(_ s: String, _ t: String) -> String {

        let sArr = [Character](s)
        var window = [Character:Int]()
        var need = [Character:Int]()
        var left = 0,right = 0
        var count = 0
        var startIndex = 0, len = Int.max
        for i in t { need[i] = 1 + (need[i] ?? 0) }
        
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            
            if need[c] != nil {
                window[c] = 1 + (window[c] ?? 0)
                if window[c] == need[c] {
                    count += 1
                }
            }
            
            while count == need.count {
                if (right - left) < len {
                    startIndex = left
                    len = right - left
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
        return len == Int.max ? "" : String(sArr[startIndex ..< startIndex + len])
    }
    // 567. 字符串的排列
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
    // 438. 找到字符串中所有字母异位词
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sArr = [Character](s)
        var window = [Character:Int]()
        var need = [Character:Int]()
        for i in p { need[i] = 1 + (need[i] ?? 0) }
        
        var left = 0,right = 0
        var count = 0
        var res = [Int]()
        
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            
            if need[c] != nil {
                window[c] = 1 + (window[c] ?? 0)
                if window[c] == need[c] {
                    count += 1
                }
            }
            
            while right - left >= p.count {
                if count == need.count{
                    res.append(left)
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
        return res
    }
    // 3. 无重复字符的最长子串
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 { return 0 }
        let sArr = [Character](s)
        
        var window = [Character:Int]()
        
        var left = 0, right = 0
        var len = Int.min
        
        while right < sArr.count {
            let c = sArr[right]
            right += 1
            window[c,default:0] += 1
            
            while window[c,default:0] > 1 {
                let d = sArr[left]
                left += 1
                window[d]! -= 1
            }
            len = max(len, right - left)
        }
        return len
    }
}
