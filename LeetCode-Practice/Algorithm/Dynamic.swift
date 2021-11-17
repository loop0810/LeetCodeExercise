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

// MARK: - 经典动态规划
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
}

// MARK: - 背包问题
extension Dynamic_Code{
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

// MARK: - 贪心算法
extension Dynamic_Code{
    // 435. 无重叠区间
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let list = intervals.sorted { val1, val2 in
            return val1[1] < val2[1]
        }
        var count = 1
        var temp_end:Int = list[0][1]
        for l in list {
            if l[0] >= temp_end {
                count += 1
                temp_end = l[1]
            }
        }
        return intervals.count - count
    }
    // 452. 用最少数量的箭引爆气球
    func findMinArrowShots(_ points: [[Int]]) -> Int {
            let list = points.sorted {point1,point2 in return point1[1] < point2[1] }

            var count = 1
            var temp_end = list[0][1]

            for l in list {
                if l[0] > temp_end {
                    count += 1
                    temp_end = l[1]
                }
            }
            return count
        }
    // 253. 会议室 II
    func minMeetingRooms(_ intervals:[[Int]]) -> Int {
        var begin:[Int] = []
        var end:[Int] = []
        
        for inter in intervals {
            begin.append(inter[0])
            end.append(inter[1])
        }
        
        begin.sort()
        end.sort()
        
        var count = 0,res = 0,i = 0,j = 0
        while i < intervals.count && j < intervals.count {
            if begin[i] < end[j] {
                count += 1
                i += 1
            } else {
                count -= 1
                j += 1
            }
            res = max(res, count)
        }
        return res
    }
    // 1024. 视频拼接
    func videoStitching(_ clips: [[Int]], _ time: Int) -> Int {
        var list = clips.sorted { clip1, clip2 in return clip1[0] <= clip2[0] }
        list.sort { clip1, clip2 in return clip1[0] == clip2[0] && clip1[0] <= clip2[0] }
        
        var res = 0
        var curEnd = 0,nextEnd = 0
        var i = 0, n = list.count
        
        while i < n && list[i][0] <= curEnd {
            while i < n && list[i][0] <= curEnd {
                nextEnd = max(nextEnd, list[i][1])
                i += 1
            }
            res += 1
            curEnd = nextEnd
            if curEnd >= time {
                return res
            }
        }
        return -1
    }
    // 55. 跳跃游戏
    func canJump(_ nums: [Int]) -> Bool {
        var farest = 0
        
        for i in 0 ..< nums.count - 1 {
            farest = max(farest, i + nums[i])
            
            if farest <= i {
                return false
            }
        }
        return farest >= nums.count - 1
    }
    // 45. 跳跃游戏 II
    func jump(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: nums.count, count: nums.count)
        
        return jumpHelper(nums,&dp, 0)
    }
    
    func jumpHelper(_ nums:[Int],_ dp:inout [Int],_ p:Int) -> Int{
        if p >= dp.count - 1 {
            return 0
        }
        if dp[p] != dp.count {
            return dp[p]
        }
        let step = nums[p]
        
        if step == 0 { return dp[p] }
        
        for i in 1 ... step {
            let minStep = jumpHelper(nums, &dp, p + i)
            
            dp[p] = min(dp[p], minStep + 1)
        }
        return dp[p]
    }
    
    func jump1(_ nums: [Int]) -> Int {
        var end = 0,farthest = 0
        var jumps = 0
        for i in 0 ..< nums.count - 1 {
            farthest = max(farthest, nums[i] + i)
            if end == i {
                jumps += 1
                end = farthest
            }
        }
        return jumps
    }
    // 134. 加油站
    // 暴力解法
    // 图解法
    // 贪心算法
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var sum = 0
        for i in 0 ..< gas.count {
            sum += gas[i]
            sum -= cost[i]
        }
        
        if sum < 0 { return -1 }

        var tank = 0
        var start = 0
        
        for i in 0 ..< gas.count {
            tank += gas[i]
            tank -= cost[i]
            if tank < 0 {
                tank = 0
                start = i + 1
            }
        }
        return start == gas.count ? 0 : start
    }
    
    // 1288. 删除被覆盖区间
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var list = intervals.sorted { val1, val2 in return val1[0] < val2[0] }
        list.sort { val1, val2 in val1[0] == val2[0] && val1[1] > val2[1] }
            
        var left = list[0][0]
        var right = list[0][1]
        
        var res = 0
        
        for i in 1 ..< list.count {
            let l = list[i]
            
            if left <= l[0] && right >= l[1] {
                res += 1
            }
            
            if right >= l[0] && right <= l[1]  {
                right = l[1]
            }
            
            if right < l[0] {
                left = l[0]
                right = l[1]
            }
        }
        return list.count - res
    }
    // 56. 合并区间
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let list = intervals.sorted {val1,val2 in return val1[0] < val2[0]}

        var res:[[Int]] = []
        res.append(list[0])
        
        for i in 1 ..< list.count {
            let cur = list[i]
            
            if cur[0] <= res[res.count - 1][1]{
                res[res.count - 1][1] = max(res[res.count - 1][1], cur[1])
            } else {
                res.append(cur)
            }
        }
        
        return res
    }
    // 986. 区间列表的交集
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var i = 0,j = 0
        var res = [[Int]]()
        while i < firstList.count && j < secondList.count {
            let f = firstList[i]
            let s = secondList[j]
            if s[0] <= f[1] && s[1] >= f[1] {
                let l = [s[0],f[1]]
                i += 1
                res.append(l)
            }
            if f[0] <= s[1] && f[1] >= s[1] {
                let l = [f[0],s[1]]
                j += 1
                res.append(l)
            }
            if f[1] < s[0] || s[1] < f[0] {
                
            }
        }
    }
}
