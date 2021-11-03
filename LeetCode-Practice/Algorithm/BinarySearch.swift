//
//  BinarySearch.swift
//  LeetCode-Practice
//
//  Created by loop安 on 2021/11/3.
//

import Foundation

class BinarySearch_Code: NSObject {
//    |374|猜数字大小||阿里||
    /**
     * Forward declaration of guess API.
     * @param  num -> your guess number
     * @return          -1 if the picked number is lower than your guess number
     *                  1 if the picked number is higher than your guess number
     *               otherwise return 0
     * func guess(_ num: Int) -> Int
     */
    func guess(_ num: Int) -> Int {
        return 1
    }
    
    func guessNumber(_ n: Int) -> Int {
        var start = 1
        var end = n
        while start <= end {
            let mid = start + (end - start) / 2
            let flag = guess(mid)
            if flag == -1 {
                end = mid - 1
            } else if flag == 1 {
                start = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
//    |offer 11|旋转数组的最小数字||阿里||
//    |278|第一个错误的版本||阿里||
//    |offer 57|和为s的连续正数序列||阿里||
//    |704|二分查找||阿里||
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }
//    |852|山脉数组的峰顶索引||阿里||
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0
        var right = arr.count - 1
        var res = -1
        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] > arr[mid + 1] {
                res = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
//    |offer 53|在排序数组中查找数字 I||阿里||
    func searchCount(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var count = 0
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                count += 1
                var index = mid
                while index > 0 && nums[index - 1] == target {
                    index -= 1
                    count += 1
                }
                index = mid
                while index < nums.count - 1 && nums[index + 1] == target {
                    index += 1
                    count += 1
                }
                return count
            }
        }
        return count
    }
}
