//
//  Dynamic.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/15.
//

import Foundation

/**
 # 初始化 base case
 dp[0][0][...] = base
 # 进行状态转移
 for 状态1 in 状态1的所有取值：
     for 状态2 in 状态2的所有取值：
         for ...
             dp[状态1][状态2][...] = 求最值(选择1，选择2...)
 */


class Dynamic_Code: NSObject {
    
    
}


extension Dynamic_Code{
    // 斐波那契数列
    func fib(n:Int) -> Int {
        
        var dp = [Int](repeating: -1, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        
        for y in 2 ... n {
            dp[y] = dp[y - 1] + dp[y - 2]
        }
        
        return dp[n]
    }
    // 硬币问题
    func coinChange(coins:[Int],amount:Int) -> Int{
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        
        dp[0] = 0
        
        for x in 0 ..< dp.count {
            for y in coins {
                if x - y < 0 {
                    continue
                }
                dp[x] = min(dp[x], dp[x - y] + 1)
            }
        }
        return (dp[amount] == amount + 1) ? -1 : dp[amount]
    }
    // 最长子序列
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        
        for i in 0 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        var res = 0
        for i in 0 ..< dp.count {
            res = max(res, dp[i])
        }
        return res
    }
    // 931.下降路径最小和
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let row = [Int](repeating: 666666, count: matrix.count)
        var dp = [[Int]](repeating: row, count: matrix.count)
        var res = Int.max
        
        for i in 0 ..< matrix.count {
            res = min(res,minHelper(matrix, &dp, matrix.count - 1, i))
        }
        return res
    }
    
    func minHelper(_ matrix: [[Int]],_ dp:inout [[Int]],_ i: Int,_ j: Int) -> Int{
        if i < 0 || j < 0 || i >= matrix.count || j >= matrix[i].count {
            return 999999
        }
        if i == 0 {
            return matrix[0][j]
        }
        if dp[i][j] != 666666 {
            return dp[i][j]
        }
        dp[i][j] = matrix[i][j] + min(minHelper(matrix, &dp, i - 1, j - 1),
                                      min(minHelper(matrix, &dp, i - 1, j),
                                          minHelper(matrix, &dp, i - 1, j + 1)))
        
        return dp[i][j]
    }
    
    // 72.编辑距离
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1 == "" { return word2.count }
        if word2 == "" { return word1.count }
        
        let s1 = word1.map{ return String($0)}
        let s2 = word2.map{ return String($0)}
        let list = [Int](repeating: 0, count: s1.count + 1)
        var dp = [[Int]](repeating: list, count: s2.count + 1)
        for i in 1 ... s2.count {
            dp[i][0] = i
        }
        for j in 1 ... s1.count {
            dp[0][j] = j
        }
        
        for i in 1 ... s2.count {
            for j in 1 ... s1.count {
                if s2[i - 1] == s1[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i][j - 1] + 1,
                                   dp[i - 1][j] + 1,
                                   dp[i - 1][j - 1] + 1)
                }
            }
        }
        
        return (dp.last?.last)!
    }
    // 516. 最长回文子序列
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s1 = s.map{return String($0)}
        let list = [Int](repeating: 0, count: s1.count)
        var dp = [[Int]](repeating: list, count: s1.count)
        
        for i in 0 ..< s1.count {
            dp[i][i] = 1
        }
        
        for i in (0 ..< s1.count).reversed() {
            for j in i + 1 ..< s1.count {
                if s1[i] == s1[j] {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    dp[i][j] = max(dp[i + 1][j],dp[i][j - 1])
                }
            }
        }
        
        return dp[0][s1.count - 1]
    }
    // Offer 095. 最长公共子序列
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let list = [Int](repeating: 0, count: text2.count + 1)
        var dp = [[Int]](repeating: list, count: text1.count + 1)
        let s1 = text1.map { return String($0)}
        let s2 = text2.map { return String($0)}
        
        for i in 1 ..< s1.count + 1 {
            for j in 1 ..< s2.count + 1{
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return (dp.last?.last)!
    }
    
    // 0-1背包问题
    // W:背包最大承重
    // N:物品总数
    // weight: 每个物品的重量
    // val: 每个物品的价值
    func bag(_ W:Int,_ N:Int,_ weight:[Int],_ val:[Int]){
        let list = [Int](repeating: 0, count: W + 1)
        var dp = [[Int]](repeating: list, count: N + 1)
        
        for i in 1 ... N {
            for j in 1 ... W {
                if j - weight[i - 1] < 0{
                    // 不将物品装入背包
                    dp[i][j] = dp[i - 1][j]
                } else {
                    // 装入或者不装入背包，择优
                    dp[i][j] = max(dp[i - 1][j - weight[i - 1]] + val[i - 1],
                                   dp[i - 1][j])
                }
                
            }
        }
    }
    
    // 416. 分割等和子集
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        nums.forEach{sum += $0}
        if sum % 2 != 0 { return false }
        
        sum = sum / 2
        let count = nums.count
        
        let list = [Bool](repeating: false, count: sum + 1)
        var dp = [[Bool]](repeating: list, count: count + 1)
        
        for i in 0 ... count {
            dp[i][0] = true
        }
        
        for i in 1 ... count {
            for j in 1 ... sum {
                if j - nums[i - 1] < 0 {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i - 1]]
                }
            }
        }
        return (dp.last?.last)!
    }
    
    // 518. 零钱兑换 II
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 {
            return 1
        }
        let n = coins.count
        let list = [Int](repeating: 0, count: amount + 1)
        var dp = [[Int]](repeating: list, count: n + 1)
        
        for i in 0 ... n {
            dp[i][0] = 1
        }
        
        for i in 1 ... n {
            for j in 1 ... amount {
                if j - coins[i - 1] < 0 {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - coins[i - 1]]
                }
            }
        }
        return (dp.last?.last)!
    }
}
