//
//  BackTrace.swift
//  LeetCode-Practice
//
//  Created by 魏安 on 2021/11/18.
//

import Foundation

/**
 result = []
 def backtrack(路径, 选择列表):
     if 满足结束条件:
         result.add(路径)
         return
     
     for 选择 in 选择列表:
         做选择
         backtrack(路径, 选择列表)
         撤销选择
 */

class BackTrace_Code: NSObject {
    
}

extension BackTrace_Code{
    // 46. 全排列
    func permute(_ nums: [Int]) -> [[Int]] {
        var list = [[Int]]()
        let track = [Int]()
        permuteHelper(nums, &list,track)
        return list
    }
    func permuteHelper(_ nums:[Int],_ res:inout [[Int]],_ track:[Int]){
        if track.count == nums.count {
            res.append(track)
            return
        }
        
        var l = track
        
        for i in nums {
            if track.contains(i) { continue }
            l.append(i)
            permuteHelper(nums, &res, l)
            l.removeLast()
        }
    }
    
    // 51. N 皇后
    func solveNQueens(_ n: Int) -> [[String]] {
        return [[".",".","."]]
    }
    // 698. 划分为k个相等的子集
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        if k > nums.count {return false}
        var sum = 0
        for i in nums {sum += i}
        if sum % k != 0 {return false}
        let target = sum / k
        
        var bucket = [Int](repeating: 0, count: k)
        let l = nums.sorted{ nums1,nums2 in return nums1 > nums2 }
        
        return canPartitionKSubsets_Helper(l, target, &bucket, 0)
    }
    
    func canPartitionKSubsets_Helper(_ nums: [Int],_ target: Int,_ bucket:inout [Int],_ index: Int) -> Bool{
        if index == nums.count {
            for i in bucket {
                if i != target { return false}
            }
            return true
        }
        
        let num = nums[index]
        for i in 0 ..< bucket.count {
            if bucket[i] + num > target { continue }
            bucket[i] = bucket[i] + num
            if (canPartitionKSubsets_Helper(nums, target, &bucket, index + 1)) { return true }
            bucket[i] = bucket[i] - num
        }
        return false
    }
    
    // 78. 子集
    func subsets(_ nums: [Int]) -> [[Int]] {
        return subsets_Helper(nums, [[]], 0)
    }
    
    func subsets_Helper(_ nums: [Int],_ res: [[Int]],_ index:Int) -> [[Int]]{
        if index == nums.count { return res }
        
        var temp = [[Int]]()
        for i in res {
            temp.append(i)
            var list = i
            list.append(nums[index])
            temp.append(list)
        }
        return subsets_Helper(nums, temp, index + 1)
    }
    // 22.括号生成
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        var s = ""
        generateParenthesis_Helper(n, n, &s, &res)
        return res
    }
    
    func generateParenthesis_Helper(_ left: Int,_ right: Int,_ track:inout String,_ res:inout [String]) {
        if right < left { return }
        if left < 0 || right < 0 { return }
        if left == 0 && right == 0 {
            res.append(track)
            return
        }
        
        track.append("(")
        generateParenthesis_Helper(left - 1, right, &track, &res)
        track.removeLast()
        
        track.append(")")
        generateParenthesis_Helper(left, right - 1, &track, &res)
        track.removeLast()
        
    }
    // 77.组合
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n <= 0 || k <= 0 { return [[]]}
        var track = [Int]()
        var res = [[Int]]()
        combine_Helper(n, k,1, &track, &res)
        return res
    }
    
    func combine_Helper(_ n:Int,_ k:Int,_ index:Int,_ track:inout [Int],_ res:inout [[Int]]) {
        if track.count == k {
            res.append(track)
            return
        }
        if index > n { return }
        for i in index ... n {
            track.append(i)
            combine_Helper(n, k,i + 1 ,&track, &res)
            track.removeLast()
        }
    }
}
