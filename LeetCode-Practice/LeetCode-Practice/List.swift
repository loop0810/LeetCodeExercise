//
//  List.swift
//  LeetCode-数组
//
//  Created by loop安 on 2021/10/28.
//  Copyright © 2021 loop. All rights reserved.
//

import Foundation

/**
 异或运算
 可使用异或运算 \oplus⊕。异或运算有以下三个性质。

 任何数和 0 做异或运算，结果仍然是原来的数，即 a^0=a。
 任何数和其自身做异或运算，结果是 0，即 a^a=0。
 异或运算满足交换律和结合律，即 a ^ b ^ a = b ^ a ^ a=b ^ (a ^ a)=b。
 
 */

class List_Code:NSObject{
    
    // MARK: --------简单--------
    //    |53|最大子序和||阿里||
        
    //    |121|买卖股票的最佳时机||阿里||
        
    //    |26| 删除有序数组中的重复项 | 通过|阿里|双指针|
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var slow = 1
        var fast = 1
        
        while fast < nums.count {
            if nums[fast] != nums[fast - 1] {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
        
    }
    //    |136|只出现一次的数字|通过|阿里|异或运算|
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for x in nums {
            res ^= x
        }
        return res
    }
    //    |88|合并两个有序数组|通过|阿里|逆向双指针|
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var tail = m + n - 1
        var cur = -1
        while p1 >= 0 || p2 >= 0 {
            if p1 == 0 {
                cur = nums2[p2]
                p2 -= 1
            } else if p2 == 0 {
                cur = nums1[p1]
                p1 -= 1
            } else if nums1[p1] > nums2[p2] {
                cur = nums1[p1]
                p1 -= 1
            } else {
                cur = nums2[p2]
                p2 -= 1
            }
            nums1[tail] = cur
            tail -= 1
        }
    }
    //    |169|多数元素||阿里||
    func majorityElement(_ nums: [Int]) -> Int {
        var dict:[Int:Int] = [:]
        for x in nums{
            let c = dict[x]
            dict[x] = (c ?? 0) + 1
        }
        for y in dict {
            if y.value > (nums.count / 2){
                return y.key
            }
        }
        return 0
    }
    //    |167|两数之和-输入有序数组||阿里||
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else {
                break
            }
        }
        return [left,right]
    }
    //    |217|存在重复元素||阿里||
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict:[Int:Int] = [:]
        for x in nums {
            let c = dict[x]
            dict[x] = (c ?? 0) + 1
        }
        for y in dict {
            if y.value > 1 {
                return true
            }
        }
        return false
    }
    //    |118|杨辉三角||阿里||
    
    //    |35|搜索插入位置|通过|阿里|快排|
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if target > nums[nums.count - 1] {
            return nums.count
        }
        var start = 0
        var end = nums.count - 1
        var mid = 0
        var res = -1
        while start < end {
            mid = (start + end) / 2
            if nums[mid] >= target {
                end = mid - 1
                res = mid
            } else {
                start = mid + 1
            }
        }
        return res
    }
    //    |1539|第K个缺失的正整数||阿里||
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        //  [2,3,4,7,11]
        //  [1,1,1,3,+6]
//        var (left, right) = (0, arr.count - 1)
//        while left <= right {
//            print("\(left)" + " -> ")
//            let mid = (left + right) / 2
//            if arr[mid] - mid - 1 >= k {
//                right = mid - 1
//            } else {
//                left = mid + 1
//            }
//            print(left)
//        }
//        return left + k
        
        var res = 0
        var c = arr[arr.count - 1] - arr.count

        if c < k {
            res = arr[arr.count - 1]
            res += k - c
        } else {
            for x in 0..<arr.count{
                c = arr[x] - (x + 1)
                if c >= k {
                    res = arr[x]
                    res -= (c - k + 1)
                    break
                }
            }
        }
        return res
    }
    //    |268|丢失的数字||阿里||
    func missingNumber(_ nums: [Int]) -> Int {
        var missingNum = nums.count
        for x in 0 ..< nums.count {
            missingNum ^= x ^ nums[x]
        }
        return missingNum
    }
    //    |283|移动零||阿里||
    func moveZeroes(_ nums: inout [Int]) {
        var slow = 0,fast = 0
        while fast < nums.count {
            if nums[fast] != 0 {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        for x in slow ..< nums.count {
            nums[x] = 0
        }
    }
    //    |350|两个数组的交集||阿里||
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums2.count > nums1.count {
            return intersect(nums2, nums1)
        }
        var dict:[Int:Int] = [:]
        var l:[Int] = []
        for x in nums2 {
            let c = dict[x]
            dict[x] = (c ?? 0) + 1
        }
        for y in nums1 {
            let c = dict[y]
            if (c ?? 0) > 0{
                l.append(y)
                let t = (c ?? 0) - 1
                if t > 0 {
                    dict[y] = t
                } else {
                    dict.removeValue(forKey: y)
                }
                
            }
        }
        return l
    }
    // MARK: --------中等--------
    // MARK: --------困难--------
    
    
    
}

