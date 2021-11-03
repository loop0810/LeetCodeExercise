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
}
