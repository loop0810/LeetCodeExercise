//
//  Math.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/18.
//

import Foundation


// http://graphics.stanford.edu/~seander/bithacks.html#ReverseParallel

class Math_Code: NSObject {
    
    // MARK: - 位操作
    // 191. 位1的个数
    func hammingWeight(_ n: Int) -> Int {
        var res = 0
        var num = n
        while num != 0 {
            num = num & (num - 1)
            res += 1
        }
        return res
    }
    // 231. 2 的幂
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false }
        return n & (n - 1) == 0
    }
    // 136. 只出现一次的数字
    func singleNumber(_ nums: [Int]) -> Int {
        var cur = 0
        for x in nums {
            cur ^= x
        }
        return cur
    }
    // 268. 丢失的数字
    func missingNumber(_ nums: [Int]) -> Int {
        var res = 0
        res = res ^ nums.count
        for i in 0 ..< nums.count {
            res = res ^ i
            res = res ^ nums[i]
        }
        return res
    }
    func missingNumber1(_ nums: [Int]) -> Int {
        let n = nums.count
        // （首项 + 末项）* 项数 / 2
        let expert = (0 + n) * (n + 1) / 2
        
        var sum = 0
        for n in nums { sum += n}
        return expert - sum
    }
    
    // mark: - 阶乘
    // 两个数相乘结果末尾有 0，一定是因为两个数中有因子 2 和 5，因为 10 = 2 x 5。
    func trailingZeroes(_ n: Int) -> Int {
        var res = 0
        var d = 5
        while d <= n {
            res += n / d
            d *= 5
        }
        return res
    }
    
    func preimageSizeFZF(_ k: Int) -> Int {
        return 0
    }
    
    // 204. 计数质数
    // TODO:需要仔细看一下
    func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        }
        var count: Int = 0
        var isPrimes = [Bool](repeating: true, count: n)
        
        for index in 2 ..< n {
            if isPrimes[index] {
                //步长为index，即：每次都是index的倍数
                var i = 2*index
                while i < n {
                    //将index的倍数设置为合数
                    isPrimes[i] = false
                    i += index
                }
            }
        }
        for index in 2 ..< n {
            if isPrimes[index] {
                count += 1
            }
        }
 
        return count
    }
    
    
}
